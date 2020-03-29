from django.contrib.gis import admin
from django.shortcuts import redirect

from covid.apps.questionnaire.models import Questionnaire


@admin.register(Questionnaire)
class AdminQuestionnaire(admin.ModelAdmin):
    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def changelist_view(self, request, extra_context=None):
        instance = self.model.load()
        return redirect(f"{instance.id}/")
