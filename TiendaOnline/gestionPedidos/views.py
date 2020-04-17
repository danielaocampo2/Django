from django.shortcuts import render
from django.http import HttpResponse
from gestionPedidos.models import Articulos
from django.core.mail import send_mail
from django.conf import settings
from gestionPedidos.forms import FormularioContacto

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
    if request.method=='POST': # si ha pulsado el boton de enviar
        
        miFormulario=FormularioContacto(request.POST)

        if miFormulario.is_valid():

            infform=miFormulario.cleaned_data # variable info de formulario
            send_mail(infform['asunto'], infform['mensaje'],
            infform.get('email','danielaocampoo@gmail.com'),['danyocam13@hotmail.com'],)  # get --> para enviar la info --> '' tambien se puede dejar sin correo
            # [correo del destinatario]
            return render(request,'gracias.html')
    else:

        miFormulario=FormularioContacto()# es vacio--> ya que aun no ha pulsado en enviar
    
    return render(request, 'formulario_contacto.html',{'form':miFormulario}) # en {lo que va utilizar }/ este crea automaticamente un formulario con coidgos html




    # ASÍ ERA MANUAL LO ANTERIOR ES  API forms

    # if request.method=="POST": # esto es solo para comprobar su funciona POST
       
    #     subject=request.POST["asunto"] # subject la puedo llamar como quiera 

    #     message=request.POST["mensaje"] + " " + request.POST["email"]
       
    #     email_from= settings.EMAIL_HOST_USER

    #     recipient_list=["danyocam13@hotmail.com"] # donde yo quiero que llegue/recipient la puedo llamar como quiera
 
    #     send_mail(subject,message,email_from,recipient_list)
       
    #     return render(request,"gracias.html")
    
    # return render(request,"contacto.html")

