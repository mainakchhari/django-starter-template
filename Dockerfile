# --- STAGE 1: Builder ---
FROM python:slim AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
WORKDIR /app

# 1. Install pure app dependencies from the lockfile into /app/.venv
# (This keeps your pyproject.toml totally clean of deployment tools)
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project --no-dev

# 2. Inject infrastructure tooling directly into that same virtual environment
RUN VIRTUAL_ENV=/app/.venv uv pip install gunicorn

# --- STAGE 2: Production ---
FROM python:slim
WORKDIR /app

# Create a non-root user (This gives you the same security as the benoitc image)
RUN useradd --create-home appuser
USER appuser

# Copy the fully baked environment and the app code
COPY --from=builder --chown=appuser:appuser /app/.venv /app/.venv
COPY --chown=appuser:appuser src/ .

# Prioritize the virtual environment in the system path
ENV PATH="/app/.venv/bin:$PATH"

# Run your app via the injected Gunicorn
CMD ["gunicorn"]
