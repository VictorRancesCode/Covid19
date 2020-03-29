import pydash as _
from rest_framework import viewsets

from covid.api.pagination import PagePaginationLarge


class SerializerMixin:
    serializer_class = None
    serializer_classes = {}

    def get_serializer_class(self):
        media_type = self.request.accepted_renderer.media_type
        paths = (f"{media_type}:{self.action}", f"{self.action}")

        classes_options = filter(
            lambda cls: cls is not None,
            map(lambda path: _.get(self.serializer_classes, path, None), paths),
        )

        try:
            serializer_class = next(classes_options)
        except StopIteration:
            serializer_class = None

        return serializer_class or self.serializer_class

    def get_serializer(self, *args, **kwargs):
        serializer_class = self.get_serializer_class()

        if "context" not in kwargs:
            if hasattr(self, "get_renderer_context"):
                kwargs["context"] = self.get_renderer_context()
            else:
                kwargs["context"] = {"view": self, "request": self.request}

        return serializer_class(*args, **kwargs)


class CSVPagination(PagePaginationLarge):
    pass


class ModelViewSet(SerializerMixin, viewsets.ModelViewSet):
    # metadata_class = BuildLinkMetadata
    # filter_backends = (DjangoFilterBackend,)
    filter_class = None
    # lookup_field = "id"

    def get_filter_class(self, request):
        return self.filter_class

    @property
    def paginator(self):
        if not hasattr(self, "_paginator"):

            media_type = self.request.accepted_renderer.media_type

            # Don't use a paginator when requesting CSV type
            if media_type == "text/csv":
                self._paginator = CSVPagination()
                return self._paginator

            if self.pagination_class is None:
                self._paginator = None
            else:
                self._paginator = self.pagination_class()

        return self._paginator
