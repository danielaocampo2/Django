from django.contrib import admin

from gestionPedidos.models import Cliente,Articulos,pedidos # importo modelos

# Register your models here.
class ClienteAdmin(admin.ModelAdmin):
    list_display= ("nombre","direccion","tfno") # LOS CAMPOS QUE QUIERO VER
    search_fields=("nombre","tfno") # para hacer busqueda por nombre y telefono

class ArticulosAdmin(admin.ModelAdmin):
    list_filter=("seccion",)# debo meter la coma al final porque es una tupla

class PedidosAdmin(admin.ModelAdmin):
    list_display=("numero","fecha")
    list_filter=("fecha",)
    date_hierarchy="fecha" # filtro migas de pan


admin.site.register(Cliente,ClienteAdmin) # importe la otra tabla 
admin.site.register(Articulos,ArticulosAdmin) # para que desde el panel de administracion tener disponible la tabla.
admin.site.register(pedidos,PedidosAdmin)

