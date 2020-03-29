from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group, User

from covid.apps.accounts.models import User

from django.utils.translation import gettext, gettext_lazy as _

#admin.site.unregister(Group)


# admin.site.register(BaseUser, UserAdmin)
@admin.register(User)
class UserAdmin(UserAdmin):
    list_display = (
        'id', 'slug', 'username', 'email', 'first_name', 'last_name', 'is_staff',)
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'email')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
        (_('account'), {'fields': (
            'slug', 'photo', 'notification', 'phone', 'gender',
            'state', 'props')}),
    )
