from covid.api.viewsets import ModelViewSet
from covid.apps.news.api.serializers import NewsSerializer
from covid.apps.news.models import News


class NewsViewSet(ModelViewSet):
    queryset = News.objects.all()
    serializer_class = NewsSerializer
    serializer_classes = {
        'list': NewsSerializer,
    }
