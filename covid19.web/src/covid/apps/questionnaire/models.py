from __future__ import annotations
import uuid

from django.contrib.auth import get_user_model
from django.db import models
from django.contrib.postgres.fields import JSONField
# Create your models here.
from django.utils.timezone import now
from django.core.cache import cache

User = get_user_model()


class Questionnaire(models.Model):
    permalink = models.UUIDField(unique=True, default=uuid.uuid4, editable=False)
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, default="")
    questions = JSONField(blank=True, default=dict)
    is_public = models.BooleanField(default=True)
    created = models.DateTimeField(default=now, editable=False)

    def __str__(self):
        return self.title

    @classmethod
    def key(cls):
        return f"{cls._meta.app_label}.{cls._meta.model_name}"

    @classmethod
    def load(cls) -> Questionnaire:
        keyname = cls.key()
        cached = cache.get(keyname, None)

        if cached:
            return cached

        instance, created = cls.objects.get_or_create()
        cache.set(keyname, instance)

        return cache.get(keyname)
