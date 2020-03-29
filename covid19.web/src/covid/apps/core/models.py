from __future__ import annotations

from django.contrib.gis.db import models
from django.utils.translation import gettext_lazy as _
from django.utils.timezone import now
from django.contrib.auth import get_user_model
from django.core.cache import cache

User = get_user_model()


class Country(models.Model):
    name = models.CharField(_('Name'), max_length=255)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "Country Setting"

    @classmethod
    def key(cls):
        return f"{cls._meta.app_label}.{cls._meta.model_name}"

    @classmethod
    def load(cls) -> Country:
        keyname = cls.key()
        cached = cache.get(keyname, None)

        if cached:
            return cached

        instance, created = cls.objects.get_or_create()
        cache.set(keyname, instance)

        return cache.get(keyname)


class Departament(models.Model):
    name = models.CharField(_('Name'), max_length=255)
    country = models.ForeignKey(Country, verbose_name=_('Country'), on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Province(models.Model):
    name = models.CharField(_('Name'), max_length=255)
    departament = models.ForeignKey(Departament, verbose_name=_('Departament'), on_delete=models.PROTECT,
                                    related_name="provinces")

    def __str__(self):
        return self.name


class Hospital(models.Model):
    name = models.CharField(_('Name'), max_length=255)
    province = models.ForeignKey(Province, on_delete=models.CASCADE, null=True)
    location = models.PointField(null=True, blank=True)
    director = models.OneToOneField(User, on_delete=models.PROTECT)

    def __str__(self):
        return self.name


class Patient(models.Model):
    STATUS_CHOICES = (
        ("transferred", _("Transferred")),
        ("hospitalized", _("Hospitalized"))
    )
    ARRIVAL_CHOICES = (
        ("transferred", _("Transferred")),
        ("normal", _("Normal")),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    hospital = models.ForeignKey(Hospital, on_delete=models.CASCADE, related_name="hospital")
    detail = models.TextField(blank=True)
    state = models.CharField(_('State'), max_length=50, choices=STATUS_CHOICES, default="hospitalized")
    arrival = models.CharField(_('Arrival'), max_length=50, choices=STATUS_CHOICES, default="normal")
    prev_hospital = models.ForeignKey(Hospital, null=True, blank=True, on_delete=models.CASCADE,
                                      related_name="prev_hospital")
    created = models.DateTimeField(default=now, editable=False)


class UserState(models.Model):
    STATE_CHOICES = (
        ("Normal", _("Normal")),
        ("Confirmed Case", _("Confirmed Case")),
        ("Suspicious Case", _("Suspicious Case")),
        ("Recovered", _("Recovered")),
        ("Dead", _("Dead")),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    state = models.CharField(_('state'), max_length=50, choices=STATE_CHOICES, default="active")
    created = models.DateTimeField(default=now, editable=False)
