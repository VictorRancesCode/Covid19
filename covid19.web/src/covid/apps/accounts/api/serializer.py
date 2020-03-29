from django.contrib.auth import authenticate, get_user_model, logout
from rest_framework import serializers

from covid.apps.accounts.models import Family

User = get_user_model()


class UserSmallSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            'username',
            'first_name',
            'last_name',
            'photo',
            'slug',
            'phone',
        )


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = (
            'url',
            'slug',
            'username',
            'first_name',
            'last_name',
            'email',
            'is_staff',
            'phone',
            'photo',
            'state',
        )

        read_only_fields = (
            'id',
            'username',
            'is_staff',
        )
        lookup_field = 'slug'
        extra_kwargs = {
            'url': {'lookup_field': 'slug'}
        }

    def to_representation(self, instance):
        data = super().to_representation(instance)
        # try:
        #     data['company'] = CompanyGeneralSerializer(instance=instance.user_company,
        #                                                context={'request': self.context['request']}).data
        # except Exception:
        #     data['company'] = None
        return data


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(label="Username")
    password = serializers.CharField(label="Password", write_only=True)

    user = None

    def validate(self, attrs):
        request = self.context['request']
        user = authenticate(request=request,
                            username=attrs['username'],
                            password=attrs['password'])

        if not user:
            raise serializers.ValidationError({'detail': 'Unable to log in with provided credentials.'})

        self.user = user

        return attrs

    def to_representation(self, instance):
        return UserSerializer(instance=self.user, context=self.context).data


class LogoutSerializer(serializers.Serializer):
    confirm_logout = serializers.BooleanField(required=True)

    def save(self, **kwargs):
        request = self.context['request']
        logout(request)


def create_new_user(username: str, first_name: str, last_name: str, password: str, email: str):
    user = User.objects.create(username=username,
                               first_name=first_name,
                               last_name=last_name,
                               email=email,
                               is_active=True)

    user.set_password(password)
    user.save(update_fields=['password'])
    # verify = VerifyEmail.objects.create(user=user, email=user.email)

    # TODO: Confirm to send email with the verification email token.
    # return user, verify
    return user, None


class RegisterSerializer(serializers.Serializer):
    first_name = serializers.CharField(label="First name", required=True)
    last_name = serializers.CharField(label="Last name", required=True)
    password = serializers.CharField(label='Password', required=True)
    email = serializers.EmailField(label="Email", max_length=100, required=True, )

    def validate(self, data):
        email = User.objects.filter(email=data.get('email'))
        if email:
            raise serializers.ValidationError({"email": "Email address is already in use"})
        return data

    def validated_email(self):
        value = self.validated_data["email"]
        email = User.objects.filter(email=value)
        if email:
            raise serializers.ValidationError("Email exist")
        return value

    def create(self, validated_data):
        request = self.context['request']
        user, verify = create_new_user(
            username=validated_data["email"],
            first_name=validated_data["first_name"],
            last_name=validated_data["last_name"],
            password=validated_data["password"],
            email=validated_data["email"],
        )
        return user


class FamilySerializer(serializers.ModelSerializer):
    class Meta:
        model = Family
        fields = ['user_f', 'created']
