# PROYECTO ABS - Fruterías Pérez

## Estructura de Directorios

- **/M3 - Programación**: Contiene la aplicación desarrollada en Java junto con el código fuente y el archivo ejecutable (.jar).
- **/M2-M10 - Base de datos**: Aquí se encuentran los archivos .sql necesarios para recrear la base de datos utilizada por la aplicación.
- **/M4 - Página web**: Aqui se guarda la pagina web. Visitable desde: "https://rubenvizros.github.io/FRUTERIAS-PEREZ/"
- **/M5 - Arduino**: Contiene el código fuente relacionado con la integración y control de dispositivos Arduino.

## Instalación

### M3 - Programación:

#### Requerimientos para compilar:

- jSerialComm-2.10.4.jar
- mysql-connector-j-8.3.0.jar
- JDK 18

#### Requerimientos para ejecutar:

- Un servidor mysql con las tablas guardadas en /M2-M10 - Base de datos y con la ip 

### M4 - Página web:

#### Requerimientos:

- XAMPP: Con mysql importado de las tablas anteriores y la carpeta con las paginas web en el root del servidor apache. Luego acceder por <ip-server>/html/index.html