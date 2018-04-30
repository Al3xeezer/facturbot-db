# facturbot-db
Base de datos de [FacturBot](https://github.com/javierdemartin/FacturBot). 

## Introducción
Este proyecto se enmarca dentro de la asignatura de Tecnologías de Ingeniería Telemática, de la ETSI Bilbao. Su objetivo es proporcionar un servicio que permita analizar las facturas telefónicas y extraer los datos más relevantes de la misma.

En concreto, este módulo se corresponde con la base de datos MySQL. Aquí, se almacenarán todos los datos necesarios para el correcto funcionamiento del servicio.

## Diseño
Se ha diseñado la base de datos y las tablas de tal forma que éstas sean lo más versátiles posibles. Para ello, se han definido las siguientes tablas:

* __User__: tabla para almacenar los datos relativos a los usuarios, para luego poder ofrecer el historial de facturas.
* __Company__: tabla correspondiente a las compañías, la cual permitirá referenciar la compañia a la que corresponde cada factura.
* __Field__: tabla en la que se almacenarán las coordenadas definidas por el administrador. Estas coordenadas se utilizarán por el bot a modo de plantilla para únicamente se realice el OCR en esas coordenadas, agilizando así el proceso de extracción de datos.
* __Invoice__: tabla en la que se almacenarán los datos extraídos de las facturas enviadas por los usuarios.
* __Suggestion__: en esta tabla se almacenarán las tarifas ofertadas por las operadoras, de manera que el bot podrá elegir en función de los datos del usuario, la tarifa que mejor se adapte a sus necesidades.

## Modelo
Según el diseño del apartado anterior, el modelo de la base de datos es el siguiente:




## Poblado de la base de datos
La base de datos es el punto de unión entre los distintos módulos del proyecto. 

Por un lado, el modulo del [administrador](https://github.com/cristina-defran/FacturBot-web) se comunicará con la base de datos y actualizará las coordenadas para las distintas plantillas. De esta forma, se actualizarán las tablas referentes a las compañias (al añadir las coordenadas y especificar la compañia, busca la referencia en la base de datos y en caso de no encontrarla la crea) y a las coordenadas.

Por otro lado, será el propio [bot de Telegram](https://github.com/javierdemartin/facturbot-bot) el que se encargue de actualizar los campos referentes a los usuarios y a sus facturas. De esta forma, cuando el usuario envíe una factura, el bot registrará a ese usuario en la base de datos y permitirá mantener un historial (tabla Invoice) de las facturas enviadas.

Por último, las tarifas ofertadas por las operadoras se añadirán manualmente en la base de datos, al menos provisionalmente.
