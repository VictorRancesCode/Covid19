from itertools import groupby

from django.contrib.humanize.templatetags.humanize import naturaltime
from rest_framework import serializers

from covid.apps.core.models import Departament, Province, Hospital


class ProvinceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Province
        fields = ['name']


class DepartamentSerializer(serializers.ModelSerializer):
    provinces = ProvinceSerializer(many=True, read_only=True)

    class Meta:
        model = Departament
        fields = ['name', 'provinces']


class HospitalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hospital
        fields = ['name', 'province', 'location']

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['longitude'] = instance.location.coords[0]
        data['latitude'] = instance.location.coords[1]
        return data

    # def to_representation(self, instance):
    #     data = super().to_representation(instance)
    #     data['provinces'] = ProvincesSerializer(Province.objects.filter(departament=instance),many=True).data
    #     return data

    # def to_representation(self, instance):
    #     data = super().to_representation(instance)
    #     from geoempleos.apps.accounts.api.serializer import UserSmallSerializer
    #     data['user'] = UserSmallSerializer(instance=instance.user).data
    #     data["publicationsCount"] = Publication.objects.filter(company=instance.user).count()
    #     data['created'] = naturaltime(instance.created)
    #     return data
