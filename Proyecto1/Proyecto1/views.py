from django.http import HttpResponse
import datetime
from django.template import Template, Context
from django.template.loader import get_template
from django.shortcuts import render# para simplificar mas

class Persona (object):
    def __init__(self,nombre,apellido): # constructor
        self.nombre=nombre
        self.apellido=apellido

def saludo(request): # funcion vista, primer vista 
    p1=Persona("Miller", "Ocampo") 
    #nombre="Miller" # se puede crear la variable o simplemente reemplazar 
    ahora=datetime.datetime.now()
    temas_curso=["Plantillas","Modelos","Formularios","Vistas","Despliegue"]
    
   # doc_externo= open("C:/Users/ASUS/Desktop/PythonWebSite/Proyecto1/Proyecto1/plantillas/miplatilla.html") # cambie el orden de las barras
   #plt=Template(doc_externo.read()) # plt -- plantilla
   # doc_externo.close()
   
    # lo remplace por el render --doc_externo=get_template('miplatilla.html') # loader.get..
    #ctx= Context({"nombre_persona":p1.nombre,"apellido_persona":p1.apellido,"momento_actual":ahora, "temas":temas_curso})# platilla..puede estar vacio o tener diccionarios-- clave, valor
    # remplace con render ---documento=doc_externo.render({"nombre_persona":p1.nombre,"apellido_persona":p1.apellido,"momento_actual":ahora, "temas":temas_curso})
    #documento=plt.render(ctx)# renderizar el documento
    # asi ea sin el render --return HttpResponse(documento) # dentro de esto se puede agregar etiquitas html
   
    return render(request, "miplatilla.html",{"nombre_persona":p1.nombre,"apellido_persona":p1.apellido,"momento_actual":ahora, "temas":temas_curso}) # ya la debo tener agregada en setting

def cursoC(request):
     fecha_actual=datetime.datetime.now()
     return render(request,"CursoC.html",{"dameFecha":fecha_actual})

def cursoCSS(request):
    return render(request,"cursoCss.html")

def despedida(request):
    return HttpResponse("Que tenga un buen dia")


def dameFecha(request): # marcador de posicion %s

    fecha_actual=datetime.datetime.now()
    documento="""<html>
    <body>
    <h2>
    Fecha y hora actuales %s
    </h2>
    </body>
    </html>""" % fecha_actual
    return HttpResponse(documento)

def calculaEdad(request,edad,agno):
    
    periodo=agno-2019
    edadFutura=edad+periodo
    documento="<html><body><h2> En el año %s tendrás %s </h2></body></html>" %(agno,edadFutura)
    return HttpResponse(documento)
