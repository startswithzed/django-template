import logging

from ninja import Router

router = Router()
logger = logging.getLogger(name="app")


@router.get("/health")
def health_check(request):
    logger.debug(msg="Debug level log: health endpoint reached")
    logger.info(msg="Info level log: returning healthy status")
    logger.warning(msg="Warning level log: example warning in health endpoint")
    logger.error(msg="Error level log: example error in health endpoint")
    logger.critical(msg="Critical level log: example critical log in health endpoint")

    return {"status": "healthy"}
