from django.shortcuts import render, render_to_response,redirect
from django.shortcuts import render
from aplicacion.forms import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.auth import login, logout
from django.http import HttpResponseRedirect, HttpResponse
##REST
from aplicacion.models import Codigo,  Lenguaje
from aplicacion.serializers import CodigoSerializer, LenguajeSerializer
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.core.urlresolvers import reverse
from django import template
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.template import RequestContext
#hora
import time
from datetime import datetime
from django.utils.timezone import utc
#


# Pagina de inicio logueado
def homeuser(request):
    usuario_actual = request.user
    return render(request, 'homeuser.html', {'usuario_actual': usuario_actual})


# def programar(request):
#     usuario_actual = request.user
#     print usuario_actual
#     print "sssssssssss"
#     ctx = {}
#     if request.method == 'POST':
#         form = CodigoForm(request.POST)
#         user = AuthUser.objects.get(id=request.user.id)
#        #hora
#         today = datetime.now()  # fecha actual
#         dateFormat = today.strftime("%Y/%m/%d")  # fecha con formato
#         hora = time.strftime("%H:%M:%S")
#         fecha = dateFormat + " " + hora
#         usuariop=1
#
#         if form.is_valid():
#             form=form.save(commit=False)
#             form.id_usuario_id = user
#             form.referencia=fecha
#             form.idlenguaje=usuariop
#             form.save()
#             return redirect(programar)
#     else:
#         form = CodigoForm()
#     ctx['form'] = form
#     return render(request,'programar.html', ctx)


def programar(request):
    usuario_actual = request.user
    print usuario_actual
    print "sssssssssss"
    ctx = {}
    if request.method == 'POST':
        form = CodigoForm(request.POST)
        user= User.objects.get(id=request.user.id)
        len = request.POST['idlenguaje']
       #hora
        today = datetime.now()  # fecha actual
        dateFormat = today.strftime("%Y/%m/%d")  # fecha con formato
        hora = time.strftime("%H:%M:%S")
        fecha = dateFormat + " " + hora
        if form.is_valid():
            form=form.save(commit=False)
            form.id_usuario=user
            form.referencia=fecha
            form.save()
            return redirect(programar)
    else:
        form = CodigoForm()
    ctx['form'] = form
    return render(request,'programar.html', ctx)

# Permisos: Acesso si no esta logeado
def loginuser(request):
    if request.user.is_authenticated():  # Si el usuario ya esta logueado, no hay sentido mostrarle el logeo
        return render(request, 'homeuser.html')
    else:
        if request.method == 'POST':
            form = FormLogin(request.POST)
            if form.is_valid():
                username = form.cleaned_data["username"]
                password = form.cleaned_data["password"]
                user = authenticate(username=username, password=password)
                if user is not None:
                    login(request, user)
                    return redirect(homeuser)
        else:
            form = FormLogin()
        return render(request, "home.html", {'form': form})

@login_required(login_url='/home/')
def salir(request):
    logout(request)
    return HttpResponseRedirect('/home')

@csrf_exempt
def registro(request):

    context = RequestContext(request)

    if request.method == 'POST':
        user_form = UserRegForm(request.POST)
        if user_form.is_valid():
            user_form.save()
            return HttpResponseRedirect('/home')
    else:
        user_form = UserRegForm()

    return render_to_response('registro.html', {'user_form': user_form}, context)


def success(request):
    usuario_actual = request.user
    return render(request, 'success.html', {'usuario_actual': usuario_actual})

def compilar(request):
    usuario_actual = request.user
    print usuario_actual
    print "sssssssssss"
    ctx = {}
    if request.method == 'POST':
        form = CodigoForm(request.POST)
        user= User.objects.get(id=request.user.id)

            # request.user.id

        if form.is_valid():
            form=form.save(commit=False)
            form.id_usuario=user
            form.save()
            return redirect(programar)
    else:
        form = CodigoForm()
    ctx['form'] = form
    return render(request, 'programar.html', ctx)



#REST
class CodigoList(APIView):
    """
    List all snippets, or create a new idsnippet.
    """
    def get(self, request, format=None):
        snippets = Codigo.objects.all()
        # snippets = Codigo.objects.values('idcodigo','id_usuario_id', 'enlace', 'codigodes', 'referencia', 'idlenguaje_id')
        print snippets
        serializer = CodigoSerializer(snippets, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = CodigoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CodigoDetail(APIView):
    """
    Retrieve, update or delete a snippet instance.
    """
    def get_object(self, pk):
        try:
            return Codigo.objects.get(pk=pk)
        except Codigo.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):

        snippet = self.get_object(pk)
        serializer = CodigoSerializer(snippet)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        snippet = self.get_object(pk)
        serializer = CodigoSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        snippet = self.get_object(pk)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# class CodigoDetailUser(APIView):
#
#
#     def get(self, request, id_usuario_id, format=None):
#
#         snippet = Codigo.objects.filter(id_usuario_id=id_usuario_id)
#         serializer = CodigoSerializer(snippet)
#         return Response(serializer.data)

class LenguajeList(APIView):
    """
    List all snippets, or create a new snippet.
    """
    def get(self, request, format=None):
        snippets = Lenguaje.objects.all()
        print snippets
        serializer = LenguajeSerializer(snippets, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = LenguajeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)