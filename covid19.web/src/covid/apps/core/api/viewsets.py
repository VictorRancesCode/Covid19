from covid.api.viewsets import ModelViewSet
from covid.apps.core.api.serializers import DepartamentSerializer, HospitalSerializer
from covid.apps.core.models import Departament, Hospital


class DepartamentViewSet(ModelViewSet):
    serializer_class = DepartamentSerializer
    queryset = Departament.objects.all()
    serializer_classes = {
        'list': DepartamentSerializer,
    }

    def get_serializer_class(self):
        return self.serializer_classes.get(self.action, self.serializer_class)


class HospitalViewSet(ModelViewSet):
    serializer_class = HospitalSerializer
    queryset = Hospital.objects.all()
    serializer_classes = {
        'list': HospitalSerializer,
    }

    def get_serializer_class(self):
        return self.serializer_classes.get(self.action, self.serializer_class)
