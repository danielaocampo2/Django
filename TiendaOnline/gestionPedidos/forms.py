from django import forms

class FormularioContacto(forms.Form):
# campos  que tiene el formulario que construye a la clase
    asunto=forms.CharField() # conjunto de caracteres
    email=forms.EmailField()
    mensaje=forms.CharField()
