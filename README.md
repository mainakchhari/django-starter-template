# Django StartProject Template

A production-ready Django template designed for Python 3.12, 3.13, and 3.14. Built with modern tooling to ensure a fast developer experience and secure deployments.

[!NOTE]
This template uses the src-layout structure

## Quick Start

Create a new project using the Django CLI. Since this template includes modern configuration files, you must specify them for placeholder replacement using the `-n` (extension) flag:

```bash
django-admin startproject \
  --template=<TEMPLATE_ZIP_URL> \
  -n pyproject.toml,Dockerfile \
  [YOUR_PROJECT_NAME]
```

The `TEMPLATE_ZIP_URL` should be the path to the latest release artifact, unless you want the [latest changes](https://github.com/mainakchhari/django-starter-template/archive/refs/heads/main.zip)

### Next Steps

1. Initialize Environment:

    ```bash
    cd my_project
    uv sync
    ```

2. Configure Settings: 
  
    See `src/project_name/settings.py` for variables)
  
    ```bash
    cp src/.env.dist src/.env
    ``` 

3. Run Migrations:
   
    ```bash
    python src/manage.py migrate
    ```

4. Launch Development Server:

    ```bash
    app-admin runserver
    ```

## Tooling Choices

This is an opinionated template focused on ease of use and good practices:

*   [uv](https://astral.sh/uv): Handles dependency management and virtual environments with extreme speed. Run `uv sync` to generate your `uv.lock`.
*   [django-environ](https://github.com/joke2k/django-environ): Manages configuration via environment variables, keeping secrets secure.
*   [whitenoise](https://whitenoise.readthedocs.io/): Efficiently serves static files directly from Django, simplifying Docker and production deployments.
