import multiprocessing as mp

# --- Server Socket ---
bind = "0.0.0.0:8000"

# --- Django WSGI Application ---
wsgi_app = "{{ project_name }}.wsgi:application"

# --- Worker Processes ---
workers = mp.cpu_count() * 2 + 1
threads = 4

# The maximum number of seconds a worker can process a request before being killed.
timeout = 30

# --- Gunicorn 25.1.0 Control Server ---
control_socket = "/tmp/gunicorn.ctl"

# --- Logging ---
# Log to stdout/stderr so Docker can easily capture the logs
accesslog = "-"
errorlog = "-"
loglevel = "info"
