from django.contrib.auth import authenticate
# from django import forms
from django.contrib.gis import forms
from django.forms import ModelForm, Textarea, DateInput, TextInput
from django.utils.encoding import force_text
from django.utils.translation import gettext_lazy as _

from covid.apps.accounts.models import User
from django.contrib.auth.forms import PasswordResetForm as BasePasswordResetForm
from django.template import loader


class PasswordField(forms.CharField):
    def __init__(self, *args, **kwargs):
        kwargs.setdefault("widget", forms.PasswordInput(render_value=False))
        self.strip = kwargs.pop("strip", True)
        super(PasswordField, self).__init__(*args, **kwargs)

    def to_python(self, value):
        if value in self.empty_values:
            return ""
        value = force_text(value)
        if self.strip:
            value = value.strip()
        return value


class RegisterForm(ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'country', 'email', 'password')

    def clean_email(self):
        email = self.cleaned_data['email']

        if User.objects.filter(email=email).exists():
            raise forms.ValidationError(_("Email has already been registered"))

        return email

    def save(self, commit=True):
        new_user = User.objects.create_user(
            email=self.cleaned_data['email'],
            password=self.cleaned_data['password'], username=self.cleaned_data['email'],
            first_name=self.cleaned_data['first_name'], last_name=self.cleaned_data['last_name'],
            country=self.cleaned_data['country'])
        return new_user


class LoginForm(forms.Form):
    email = forms.CharField(label=_("Email"), max_length=30, required=True)
    password = PasswordField(label=_("Password"), required=True)
    # remember = forms.BooleanField(label=_("Remember Me"), required=False)
    user = None

    def clean(self):
        super(LoginForm, self).clean()
        if 'email' not in self.cleaned_data or 'password' not in self.cleaned_data:
            raise forms.ValidationError("El nombre de usuario y/o la contraseña que especificó no son correctos.")

        user = authenticate(username=self.cleaned_data['email'],
                            password=self.cleaned_data['password'])
        if user:
            if user.is_active:
                self.user = User.objects.get(id=user.id)
            else:
                raise forms.ValidationError("Esta cuenta esta inactiva")
        else:
            raise forms.ValidationError("El nombre de usuario y/o la contraseña que especificó no son correctos.")

        return self.cleaned_data

