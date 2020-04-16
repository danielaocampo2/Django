[1mdiff --git a/TiendaOnline/TiendaOnline/__pycache__/settings.cpython-37.pyc b/TiendaOnline/TiendaOnline/__pycache__/settings.cpython-37.pyc[m
[1mindex 4d9f16d..a24b65d 100644[m
Binary files a/TiendaOnline/TiendaOnline/__pycache__/settings.cpython-37.pyc and b/TiendaOnline/TiendaOnline/__pycache__/settings.cpython-37.pyc differ
[1mdiff --git a/TiendaOnline/TiendaOnline/__pycache__/urls.cpython-37.pyc b/TiendaOnline/TiendaOnline/__pycache__/urls.cpython-37.pyc[m
[1mindex 07f0985..414f082 100644[m
Binary files a/TiendaOnline/TiendaOnline/__pycache__/urls.cpython-37.pyc and b/TiendaOnline/TiendaOnline/__pycache__/urls.cpython-37.pyc differ
[1mdiff --git a/TiendaOnline/TiendaOnline/settings.py b/TiendaOnline/TiendaOnline/settings.py[m
[1mindex 40c3e15..20d7ce6 100644[m
[1m--- a/TiendaOnline/TiendaOnline/settings.py[m
[1m+++ b/TiendaOnline/TiendaOnline/settings.py[m
[36m@@ -109,7 +109,8 @@[m [mAUTH_PASSWORD_VALIDATORS = [[m
 # Internationalization[m
 # https://docs.djangoproject.com/en/3.0/topics/i18n/[m
 [m
[31m-LANGUAGE_CODE = 'en-us'[m
[32m+[m[32m#LANGUAGE_CODE = 'en-us'[m
[32m+[m[32mLANGUAGE_CODE = 'es-eu'[m
 [m
 TIME_ZONE = 'UTC'[m
 [m
[1mdiff --git a/TiendaOnline/TiendaOnline/urls.py b/TiendaOnline/TiendaOnline/urls.py[m
[1mindex c79099c..2f37e58 100644[m
[1m--- a/TiendaOnline/TiendaOnline/urls.py[m
[1m+++ b/TiendaOnline/TiendaOnline/urls.py[m
[36m@@ -15,7 +15,11 @@[m [mIncluding another URLconf[m
 """[m
 from django.contrib import admin[m
 from django.urls import path[m
[32m+[m[32mfrom gestionPedidos import views[m
 [m
 urlpatterns = [[m
     path('admin/', admin.site.urls),[m
[32m+[m[32m    path('busqueda_productos/',views.busqueda_productos),[m
[32m+[m[32m    path('buscar/',views.buscar),[m
[32m+[m[32m    path('contacto/',views.contacto),[m
 ][m
[1mdiff --git a/TiendaOnline/gestionPedidos/__pycache__/admin.cpython-37.pyc b/TiendaOnline/gestionPedidos/__pycache__/admin.cpython-37.pyc[m
[1mindex 9b55782..39804ec 100644[m
Binary files a/TiendaOnline/gestionPedidos/__pycache__/admin.cpython-37.pyc and b/TiendaOnline/gestionPedidos/__pycache__/admin.cpython-37.pyc differ
[1mdiff --git a/TiendaOnline/gestionPedidos/__pycache__/models.cpython-37.pyc b/TiendaOnline/gestionPedidos/__pycache__/models.cpython-37.pyc[m
[1mindex bade20c..76d4907 100644[m
Binary files a/TiendaOnline/gestionPedidos/__pycache__/models.cpython-37.pyc and b/TiendaOnline/gestionPedidos/__pycache__/models.cpython-37.pyc differ
[1mdiff --git a/TiendaOnline/gestionPedidos/admin.py b/TiendaOnline/gestionPedidos/admin.py[m
[1mindex 8c38f3f..e1ee467 100644[m
[1m--- a/TiendaOnline/gestionPedidos/admin.py[m
[1m+++ b/TiendaOnline/gestionPedidos/admin.py[m
[36m@@ -1,3 +1,22 @@[m
 from django.contrib import admin[m
 [m
[32m+[m[32mfrom gestionPedidos.models import Cliente,Articulos,pedidos # importo modelos[m
[32m+[m
 # Register your models here.[m
[32m+[m[32mclass ClienteAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display= ("nombre","direccion","tfno") # LOS CAMPOS QUE QUIERO VER[m
[32m+[m[32m    search_fields=("nombre","tfno") # para hacer busqueda por nombre y telefono[m
[32m+[m
[32m+[m[32mclass ArticulosAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_filter=("seccion",)# debo meter la coma al final porque es una tupla[m
[32m+[m
[32m+[m[32mclass PedidosAdmin(admin.ModelAdmin):[m
[32m+[m[32m    list_display=("numero","fecha")[m
[32m+[m[32m    list_filter=("fecha",)[m
[32m+[m[32m    date_hierarchy="fecha" # filtro migas de pan[m
[32m+[m
[32m+[m
[32m+[m[32madmin.site.register(Cliente,ClienteAdmin) # importe la otra tabla[m[41m [m
[32m+[m[32madmin.site.register(Articulos,ArticulosAdmin) # para que desde el panel de administracion tener disponible la tabla.[m
[32m+[m[32madmin.site.register(pedidos,PedidosAdmin)[m
[41m+[m
[1mdiff --git a/TiendaOnline/gestionPedidos/models.py b/TiendaOnline/gestionPedidos/models.py[m
[1mindex 300d556..17dd75f 100644[m
[1m--- a/TiendaOnline/gestionPedidos/models.py[m
[1m+++ b/TiendaOnline/gestionPedidos/models.py[m
[36m@@ -4,10 +4,13 @@[m [mfrom django.db import models[m
 [m
 class Cliente(models.Model): # primera tabla[m
     nombre=models.CharField(max_length=30) # tipo -- almacenar tecto, max length .. longitud , maximo 30 caracteres[m
[31m-    direccion=models.CharField(max_length=50)[m
[31m-    email=models.EmailField() # email validos[m
[32m+[m[32m    direccion=models.CharField(max_length=50, verbose_name="la dirección") # verbos_name cambia el nombre en el panel[m
[32m+[m[32m    email=models.EmailField(blank=True,null=True) # email validos[m
     tfno=models.CharField(max_length=7)[m
 [m
[32m+[m[32m    def __str__(self):[m
[32m+[m[32m        return self.nombre  # lo que nos va aparecer[m
[32m+[m
 class Articulos(models.Model):[m
     nombre=models.CharField(max_length=30)[m
     seccion=models.CharField(max_length=20)[m
[1mdiff --git a/TiendaOnline/gestionPedidos/views.py b/TiendaOnline/gestionPedidos/views.py[m
[1mindex 91ea44a..0af094f 100644[m
[1m--- a/TiendaOnline/gestionPedidos/views.py[m
[1m+++ b/TiendaOnline/gestionPedidos/views.py[m
[36m@@ -1,3 +1,34 @@[m
 from django.shortcuts import render[m
[32m+[m[32mfrom django.http import HttpResponse[m
[32m+[m[32mfrom gestionPedidos.models import Articulos[m
 [m
 # Create your views here.[m
[32m+[m
[32m+[m
[32m+[m[32mdef busqueda_productos(request):  # se puede llamar como quiera[m
[32m+[m[32m    return render(request, "busqueda_productos.html")[m
[32m+[m
[32m+[m
[32m+[m[32mdef buscar(request):[m
[32m+[m[32m    if request.GET["prd"]:  # para controlar que siempre ingrese algo cuando le da buscar[m
[32m+[m[32m        # mensaje="Articulo buscado: %r" %request.GET["prd"]# info del cuadro de texto[m
[32m+[m[32m        producto = request.GET["prd"][m
[32m+[m[32m        if len(producto) > 20:  # para limitar el ingreso de caracteres[m
[32m+[m[32m            mensaje = "Texto de busqueda demasiado largo"[m
[32m+[m[32m        else:[m
[32m+[m[32m            # variable que guarda el modelo donde estoy haciendo la busquuedad[m
[32m+[m[32m            articulos = Articulos.objects.filter(nombre__icontains=producto)[m
[32m+[m[32m # propiedad icontrains-- sustituye el like (select*...) en que tenga la palabra raqueta sin importar la posición[m
[32m+[m[32m            # en llaves pongo que va a renderizar del documento[m
[32m+[m[32m            return render(request, "resultados_busqueda.html", {"articulos": articulos, "query": producto})[m
[32m+[m
[32m+[m[32m    else:[m
[32m+[m
[32m+[m[32m        mensaje = "No has introducido nada"[m
[32m+[m
[32m+[m[32m    return HttpResponse(mensaje)  # importelo[m
[32m+[m
[32m+[m[32mdef contacto(request):[m
[32m+[m[32m    if request.method=="POST": # esto es solo para comprobar su funciona POST[m
[32m+[m[32m        return render(request,"gracias.html")[m
[32m+[m[32m    return render(request,"contacto.html")[m
