# PROYECTO ABS - Fruterías Pérez

## Estructura de Directorios

- **/M3 - Programación**: Contiene la aplicación desarrollada en Java junto con el código fuente y el archivo ejecutable (.jar).
- **/M2-M10 - Base de datos**: Aquí se encuentran los archivos .sql necesarios para recrear la base de datos utilizada por la aplicación.
- **/M4 - Página web**: Aquí se guarda la página web. Puede ser visitada desde [este enlace](https://rubenvizros.github.io/FRUTERIAS-PEREZ/).
- **/M5 - Arduino**: Contiene el código fuente relacionado con la integración y control del Arduino.

## Instalación

### M3 - Programación:

#### Requerimientos para compilar:

- jSerialComm-2.10.4.jar
- mysql-connector-j-8.3.0.jar
- JDK 18

#### Requerimientos para ejecutar:

- Un servidor MySQL con las tablas que estan guardadas en `/M2-M10 - Base de datos` y con la IP: 172.17.126.90 
- Luego en la base de datos ejecutar las siguientes sentencias para agrgar el usuario que usa la aplicacion de java:
	- CREATE USER 'javaApp'@'%' IDENTIFIED BY 'javaAppPass';
	- GRANT ALL PRIVILEGES ON fruterias_perez . * TO 'javaApp'@'%';

### M4 - Página web:

#### Requerimientos:

- XAMPP: Con MySQL importado de las tablas anteriores y la carpeta con las páginas web en el root del servidor Apache. Luego acceder por `<ip-server>/html/index.html`

### M5 - Arduino:

#### Requerimientos para compilar:

- Librerias `Wire.h` y `LiquidCrystal_I2C.h` 

#### GRUPO DE FRUTERIAS PEREZ COMPUESTO POR: 
	- LLuc Farre
	- Adrian Morales
	- Amine Mernich
	- Ruben Vizcaino