# Generated by Django 3.0.4 on 2020-03-29 02:40

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, verbose_name='Title')),
                ('detail', models.TextField(verbose_name='Detail')),
                ('image', models.ImageField(blank=True, null=True, upload_to='news', verbose_name='Image')),
                ('link', models.URLField(max_length=255, verbose_name='Link')),
                ('created', models.DateTimeField(default=django.utils.timezone.now, editable=False)),
            ],
            options={
                'verbose_name_plural': 'News',
            },
        ),
    ]
