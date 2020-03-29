from django.contrib.gis import admin

from covid.apps.news.models import News


@admin.register(News)
class AdminNews(admin.ModelAdmin):
    ...
