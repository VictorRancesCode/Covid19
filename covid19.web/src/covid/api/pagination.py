from collections import OrderedDict

from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class PagePagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'page_size'
    max_page_size = 10

    def get_page_size(self, request):
        page_size = request.query_params.get(self.page_size_query_param, None)
        csv_format = request.query_params.get('format', None) == 'csv'

        if csv_format and request.user.is_superuser and page_size == '-1':
            return

        return super(PagePagination, self).get_page_size(request)

    def get_paginated_response(self, data):
        from_index = ((self.page.number - 1) * self.max_page_size) + 1
        to_index = min(self.page.number * self.max_page_size, self.page.paginator.count)

        return Response(OrderedDict([
            ('count', self.page.paginator.count),
            ('from_index', from_index),
            ('to_index', to_index),
            ('next', self.get_next_link()),
            ('previous', self.get_previous_link()),
            ('results', data)
        ]))


class PagePaginationLarge(PagePagination):
    page_size = 2000
    max_page_size = 2000

