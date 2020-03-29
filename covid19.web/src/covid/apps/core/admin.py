# Register your models here.
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group, User
from django.contrib.gis import admin
from django.shortcuts import redirect

from covid.apps.accounts.models import User

from django.utils.translation import gettext, gettext_lazy as _

from covid.apps.core.models import Country, Departament, Province, Hospital

admin.site.unregister(Group)


# admin.site.register(BaseUser, UserAdmin)


class DepartamentInline(admin.TabularInline):
    model = Departament


@admin.register(Country)
class AdminCountry(admin.ModelAdmin):
    inlines = [
        DepartamentInline
    ]

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def changelist_view(self, request, extra_context=None):
        instance = self.model.load()
        return redirect(f"{instance.id}/")


class ProvinceInline(admin.TabularInline):
    model = Province


@admin.register(Departament)
class AdminDepartament(admin.ModelAdmin):
    inlines = [
        ProvinceInline
    ]


@admin.register(Hospital)
class AdminHospital(admin.OSMGeoAdmin):
    openlayers_url = 'https://cdnjs.cloudflare.com/ajax/libs/openlayers/2.13.1/OpenLayers.js'
