from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path
from ninja import NinjaAPI

from .api import router

api = NinjaAPI(docs_url="/docs")
api.add_router("/", router)

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", api.urls),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
