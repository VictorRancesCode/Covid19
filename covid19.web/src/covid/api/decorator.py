from functools import wraps

from rest_framework import status
from rest_framework.response import Response


def serializer_action(**options):
    serializer_class = options.get("serializer_class")

    def decorator(func):
        @wraps(func)
        def wrapper(view, request, *args, **kwargs):
            instance = None,

            if 'detail' in dir(func):
                if func.detail:
                    instance = view.get_object()
                else:
                    instance = view.get_queryset()

            serializer = serializer_class(context={
                'view': view,
                'request': request,
                'instance': instance,
            }, data=request.data)

            serializer.is_valid(raise_exception=True)
            response = func(view, request, serializer, *args, **kwargs)

            if response:
                return response

            return Response(serializer.data, status=status.HTTP_200_OK)

        return wrapper

    return decorator
