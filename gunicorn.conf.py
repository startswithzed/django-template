wsgi_app = "config.wsgi:application"
bind = "0.0.0.0:8000"
reload = True

# Workers
workers = 2

# Logging
accesslog = "-"
errorlog = "-"
loglevel = "info"

# Log format
access_log_format = "%(t)s [%(p)s] %(r)s %(s)s"
