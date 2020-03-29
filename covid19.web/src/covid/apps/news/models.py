from django.contrib.gis.db import models
from django.utils.timezone import now
from django.utils.translation import gettext_lazy as _


class News(models.Model):
    title = models.CharField(_('Title'), max_length=255)
    detail = models.TextField(_('Detail'))
    image = models.ImageField(_('Image'), upload_to='news', blank=True, null=True)
    link = models.URLField(_('Link'), max_length=255)
    created = models.DateTimeField(default=now, editable=False)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = "News"
