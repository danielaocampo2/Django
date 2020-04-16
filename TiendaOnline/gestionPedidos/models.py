from django.db import models

# Create your models here.

class Cliente(models.Model): # primera tabla
    nombre=models.CharField(max_length=30) # tipo -- almacenar tecto, max length .. longitud , maximo 30 caracteres
    direccion=models.CharField(max_length=50, verbose_name="la dirección") # verbos_name cambia el nombre en el panel
    email=models.EmailField(blank=True,null=True) # email validos
    tfno=models.CharField(max_length=7)

    def __str__(self):
        return self.nombre  # lo que nos va aparecer

class Articulos(models.Model):
    nombre=models.CharField(max_length=30)
    seccion=models.CharField(max_length=20)
    precio=models.IntegerField()# tipo entero

    def __str__(self):
        return 'El nombre es %s la sección es %s y el precio es %s' %(self.nombre,self.seccion,self.precio)


class pedidos(models.Model):
    numero=models.IntegerField()
    fecha=models.DateField()
    entregado=models.BooleanField()