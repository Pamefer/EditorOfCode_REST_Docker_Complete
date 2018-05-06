from django.forms import Form, ModelForm, PasswordInput, CharField
from django.contrib.auth import authenticate
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import UserCreationForm

from . import models as mod

1
class CodigoForm(ModelForm):
    class Meta:
        model = mod.Codigo
        exclude= ['id_usuario_id']
        fields=('enlace', 'codigodes', 'idlenguaje')


class FormLogin(Form):
    username = forms.CharField(label='',required=True, widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Nombre de usuario'}))
    password = forms.CharField(label='', required=True,  widget=forms.PasswordInput(attrs={'class': 'form-control','placeholder': 'Contrasenia'}))
    def clean(self):
        """Comprueba que no exista un username igual en la db"""
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
        user = authenticate(username=username, password=password)
        if user is None:
            invalido = ValidationError(
                ('Nombre de usuario o clave invalidos'),
            )
        if user is None:
            print('usernameeeeeeee')
            self.add_error('password', invalido)


class UserRegForm(UserCreationForm):
    username = forms.CharField(label='',required=True, widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Nombre de usuario'}))
    email = forms.CharField(label='', required=True,  widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Email'}))
    password1 = forms.CharField(label='', required=True,  widget=forms.PasswordInput(attrs={'class': 'form-control','placeholder': 'Contrasenia'}))
    password2 = forms.CharField(label='', required=True,  widget=forms.PasswordInput(attrs={'class': 'form-control','placeholder': 'Repetir contrasenia'}))

    class Meta:
        model = User
        fields = ('username', 'email')

    def __init__(self, *args, **kwargs):
        super(UserRegForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs.update({'class': 'form-control'})
        self.fields['email'].widget.attrs.update({'class': 'form-control'})
        self.fields['password1'].widget.attrs.update({'class': 'form-control'})
        self.fields['password2'].widget.attrs.update({'class': 'form-control'})