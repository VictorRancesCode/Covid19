from django.conf import settings
from django.contrib.auth import login
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from covid.api.decorator import serializer_action
from covid.api.viewsets import ModelViewSet
from covid.apps.accounts.api.serializer import UserSerializer, LoginSerializer, \
    LogoutSerializer, RegisterSerializer, FamilySerializer
from covid.apps.accounts.models import User, Family


class AuthViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = []
    authentication_classes = []
    serializer_classes = {
        'list': UserSerializer,
        'login': LoginSerializer,
        'logout': LogoutSerializer,
    }
    lookup_field = 'slug'

    def get_serializer_class(self):
        return self.serializer_classes.get(self.action, self.serializer_class)

    @serializer_action(serializer_class=LoginSerializer)
    @action(methods=['options', 'post'],
            detail=False, serializer_class=LoginSerializer)
    def login(self, request, serializer, **kwargs):
        """Authenticate an user given their username and password."""
        serializer.is_valid()

        login(request, serializer.user)

        response = Response(
            serializer.data,
            status=status.HTTP_200_OK,
            headers={'Location': settings.LOGIN_REDIRECT_URL})

        return response

    @serializer_action(serializer_class=LogoutSerializer)
    @action(methods=['post'],
            detail=False)
    def logout(self, request, serializer, **kwargs):
        """Logout from your active session"""
        serializer.save()

        response = Response(data={'message': 'You are logged out.'})
        response.delete_cookie(settings.CSRF_COOKIE_NAME)

        return response

    @action(
        detail=False,
        methods=["options", "post"],
        authentication_classes=[]
    )
    @serializer_action(serializer_class=RegisterSerializer)
    def register(self, request, serializer, **kwargs):
        """
        Register User
        """
        user = serializer.save()
        login(request, user)
        resp = "Thank you, please check your email and click the activation link to activate your account."
        return Response({"message": resp, "redirect_url": "/profile"}, status=status.HTTP_201_CREATED)


class LoggedUserViewSet(GenericViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (IsAuthenticated,)

    # def list(self, request, **kwargs):
    #     serializer = UserDashboardSerializer(instance=request.user, context=self.get_renderer_context())
    #     # data = serializer.data
    #     return Response(data=serializer.data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, serializer_class=FamilySerializer)
    def families(self, request, **kwargs):
        families = Family.objects.filter(user=request.user).order_by('-id')
        serializer = FamilySerializer(families, context={'request': request}, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)
