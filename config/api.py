import logging

from django.db import connections
from ninja import Router

router = Router()
logger = logging.getLogger(name="app")


@router.get("/health", response={(200, 503): dict})
def health_check(request):
    # logger.debug(msg="Debug level log: health endpoint reached")
    # logger.info(msg="Info level log: returning healthy status")
    # logger.warning(msg="Warning level log: example warning in health endpoint")
    # logger.error(msg="Error level log: example error in health endpoint")
    # logger.critical(msg="Critical level log: example critical log in health endpoint")
    try:
        with connections["default"].cursor() as cursor:
            cursor.execute("SELECT 1;")
    except Exception as e:
        logger.error(msg=f"Health check failed: {e}")
        return 503, {"status": "unhealthy", "reason": "database connection failed"}
    return 200, {"status": "healthy"}
