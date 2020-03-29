import random
import string

from django.contrib.auth.models import AbstractUser
from django.contrib.gis.db import models
from django.contrib.postgres.fields import JSONField
from django.utils.timezone import now
from django.utils.translation import gettext_lazy as _


class User(AbstractUser):
    GENDER_CHOICES = (
        ("F", _("Female")),
        ("M", _("Male")),
    )
    STATE_CHOICES = (
        ("Normal", _("Normal")),
        ("Confirmed Case", _("Confirmed Case")),
        ("Suspicious Case", _("Suspicious Case")),
        ("Recovered", _("Recovered")),
        ("Dead", _("Dead")),
    )
    photo = models.ImageField(_('photo'), upload_to='accounts/users', null=True, blank=True)
    notification = models.TextField(blank=True, null=True)
    address = models.CharField(_('address'), max_length=200, null=True)
    phone = models.CharField(_('phone'), max_length=500, blank=True)
    gender = models.CharField(_('gender'), choices=GENDER_CHOICES, max_length=50, blank=True, null=True, default="M")
    state = models.CharField(_('state'), max_length=50, choices=STATE_CHOICES, default="active")
    location = models.PointField(null=True, blank=True)
    props = JSONField(blank=True, default=dict)
    slug = models.SlugField(max_length=1000, unique=True)
    created = models.DateTimeField(default=now, editable=False)

    def __str__(self):
        return self.username

    def random_string_generator(self, size=10, chars=string.digits):
        return ''.join(random.choice(chars) for _ in range(size))

    def unique_slug_generator(self):
        new_slug = self.random_string_generator(size=7)
        qs_exists = User.objects.filter(slug=new_slug).exists()
        if qs_exists:
            return self.unique_slug_generator()
        return new_slug

    def save(self, *args, **kwargs):
        if self.slug == "":
            self.slug = self.unique_slug_generator()
        super(User, self).save()

    def get_image(self):
        if self.photo:
            return self.photo.url
        return ""


class Family(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="user")
    user_f = models.ForeignKey(User, on_delete=models.CASCADE, related_name="user_family")
    created = models.DateTimeField(default=now, editable=False)


class Alert(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="user_alert")
