from django.forms import widgets
from rest_framework import serializers
from aplicacion.models import Codigo, Lenguaje


class CodigoSerializer(serializers.ModelSerializer):
    # lenguaje = serializers.ReadOnlyField(source="idlenguaje__lenguaje")
    class Meta:
        model = Codigo
        fields = ('idcodigo', 'id_usuario', 'enlace', 'codigodes','referencia','idlenguaje')



class LenguajeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lenguaje
        fields = ('idlenguaje', 'lenguaje')

