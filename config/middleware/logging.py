import logging
import time

request_logger = logging.getLogger("app.requests")


class RequestLogMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        start_time = time.monotonic()

        method = request.method
        path = request.get_full_path()
        remote_address = request.META.get("REMOTE_ADDR")
        user_agent = request.META.get("HTTP_USER_AGENT")

        if hasattr(request, "user") and request.user.is_authenticated:
            user = request.user.username
        else:
            user = "Anonymous"

        request_details_str = (
            f'"{method} {path}" {remote_address} {user} "{user_agent}"'
        )
        request_logger.info(f"Request Received: {request_details_str}")

        response = self.get_response(request)

        status_code = response.status_code
        run_time_ms = f"{(time.monotonic() - start_time) * 1000:.2f}"

        response_details_str = f'"{method} {path}" {status_code} {run_time_ms}ms'
        request_logger.info(f"Response Sent: {response_details_str}")

        return response

    def process_exception(self, request, exception):
        request_logger.exception(msg=f"Unhandled exception: {exception}")
        return None
