from django.shortcuts import render
from django.http import HttpResponse
from gestionPedidos.models import Articulos

# Create your views here.


def busqueda_productos(request):  # se puede llamar como quiera
    return render(request, "busqueda_productos.html")


def buscar(request):
    if request.GET["prd"]:  # para controlar que siempre ingrese algo cuando le da buscar
        # mensaje="Articulo buscado: %r" %request.GET["prd"]# info del cuadro de texto
        producto = request.GET["prd"]
        if len(producto) > 20:  # para limitar el ingreso de caracteres
            mensaje = "Texto de busqueda demasiado largo"
        else:
            # variable que guarda el modelo donde estoy haciendo la busquuedad
            articulos = Articulos.objects.filter(nombre__icontains=producto)
 # propiedad icontrains-- sustituye el like (select*...) en que tenga la palabra raqueta sin importar la posición
            # en llaves pongo que va a renderizar del documento
            return render(request, "resultados_busqueda.html", {"articulos": articulos, "query": producto})

    else:

        mensaje = "No has introducido nada"

    return HttpResponse(mensaje)  # importelo

def contacto(request):
    if request.method=="POST": # esto es solo para comprobar su funciona POST
        return render(request,"gracias.html")
    return render(request,"contacto.html")
