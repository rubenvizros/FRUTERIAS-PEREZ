#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

const int BUFFER_SIZE = 150;
char buf[BUFFER_SIZE];

//Crear el objeto lcd  dirección  0x27 y 16 columnas x 2 filas
LiquidCrystal_I2C lcd(0x27,16,2);  //

void setup() {
  // Inicializar el LCD
  lcd.init();
  //Inicializamos puerto Serie
  Serial.begin(9600);
  //Encender la luz de fondo.
  lcd.backlight();
  // Enviamos el caracter 'G' para decir a la aplicacion que el arduino esta listo.
  Serial.print("G");
  // Situamos el cursor al principio
  lcd.setCursor(0,0);
  // Imprimimos nuestro nombre
  lcd.print("FRUTERIAS  PEREZ");
  //Hacemos un bucle para rellenar de asteriscos la segunda linea
  for (int i = 0; i < 16; i++){
    //Vamos canviando la posicion del cursor
    lcd.setCursor(i,1);
    //Ponemos un asterisco
    lcd.print("*");
  }
}

void loop() {
  if (Serial.available() > 0) {
    // Limpiamos el buffer
    memset(buf, 0, sizeof(buf));
    // Leemos los datos del puerto serie
    int bytesRead = Serial.readBytesUntil('\n', buf, BUFFER_SIZE);
    // Verificamos si se leyeron datos
    if (bytesRead > 0) {
      // Limpiamos la LCD
      lcd.clear();
      // Convertimos el BUFFER en string
      String productBuff = String(buf);
      // Seleccionamos el nombre del producto de la string anterior
      String productName = productBuff.substring(0,productBuff.indexOf(";"));
      // Ubicamos el cursor en la primera posición (columna:0) de la primera línea (fila:0)
      lcd.setCursor(0, 0);
      // Imprimimos el nombre del producto en la pantalla
      lcd.print(productName);
      // Seleccionamos el precio del producto de la string productBuff
      String productPrice = productBuff.substring(productBuff.indexOf(";") + 1, productBuff.length()); //PROBAR A RESTAR UNA POSICION Y PONER EL SIMBOLO DE '€'
      // Calculamos en que columna tiene que enpezar a escribir
      int pos = 16 - productPrice.length();
      // Situamos el cursor donde hemos calculado la posicion anterior
      lcd.setCursor(pos, 1);
      // Imprimimos el precio sobre la pantalla
      lcd.print(productPrice);
    }
  }
  delay(100);
}