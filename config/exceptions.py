import logging
import uuid

from .urls import api

logger = logging.getLogger(name="app")


@api.exception_handler(Exception)
def global_exception_handler(request, exc):
    error_id = uuid.uuid4()
    logger.error(msg=f"Unhandled exception - ID: {error_id} - {exc}", exc_info=True)
    return api.create_response(
        request,
        {"message": "An unexpected server error occurred", "error_id": str(error_id)},
        status=500,
    )
