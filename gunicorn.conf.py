wsgi_app = "config.wsgi:application"
bind = "0.0.0.0:8000"
reload = True

# Workers
workers = 2

# Logging
errorlog = "-"
loglevel = "info"
