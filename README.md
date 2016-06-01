**CULQI INTEGRATION DEMO PROJECT**

Demo Project que muestra como puede integrarse el gem culqi con un proyecto Rails
Cuenta con sólo 2 modelos: User y Product

Luego de crear un usuario y un Producto, al presionar el Botón Pagar, se cargará el formulario de pago de Culqi.

Hacer Referencia a la documentación de Culqi en:

https://www.culqi.com/docs/

y a la documentación del culqi gem en:

https://github.com/augustosamame/culqiruby

Recuerde que para el correcto funcionamiento de la gema, los siguientes ENV variables deben estar presentes:


CULQI_KEY="llave de encriptación entregada por Culqi"

CULQI_ENDPOINT="dominio del API de Culqi"

CULQI_CODIGO_COMERCIO="código de comercio asignado por Culqi"
