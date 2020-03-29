from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from rest_framework import routers


class Router(routers.DefaultRouter):
    include_format_suffixes = True
    include_root_view = False

    def get_urls(self):
        urlpatterns = super().get_urls()
        urlpatterns += [
            url('^$', login_required(self.get_api_root_view())),
        ]

        return urlpatterns
