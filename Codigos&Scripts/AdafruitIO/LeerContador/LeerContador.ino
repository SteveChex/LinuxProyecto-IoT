// Se incluyen las librerias a utilizar
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
// Se declaran laxs variables
int counter = 0;
bool tstat = HIGH;
// Se establece el puerto del servidor
WebServer server(80);
// Se establece la red de conexion
const char* ssid = "GUAIFAI";
const char* password = "apollo1234";
// Se declaran las funciones del servidor web
// Las funciones handle de P1 a P4 se ocupan de pasar 
// el estado del parqueo en cuestion

void handleCounter_F(){
  server.send(200,"text/html",SendHTML(counter));
}

void setup() {
  Serial.begin(115200);
  while (! Serial);
  // Se inicializa el modulo WiFi
  WiFi.begin(ssid,password);
  WiFi.mode (WIFI_STA);
  // Se espera a la conexion de la red
  while(WiFi.status()!=WL_CONNECTED);
  // Se muestra la IP en el monitor serial
  Serial.println(WiFi.localIP());
  // Se activan las funciones de WiFi
  server.on("/",handleCounter_F);
  server.on("/readCC",handleCounter_F);
  // Se abre el servidor
  server.begin();
}
// Loop principal
void loop() {
  server.handleClient();
  if (tstat == LOW){
    tstat = HIGH;
    counter = counter + 1;
  }
}

String SendHTML(int contador){
  String ptr = "<!DOCTYPE html> <html>\n";
  ptr += "<head></head>\n";
  ptr += "<body>\n";

  ptr += "<p style=\"font-size:100px\"> Counter: ";
  ptr += contador;
  ptr += " </p><a style=\"font-size:100px\" href=\"/readCC\">Update</a>\n";
  tstat = LOW;

  ptr += "</body>\n";
  ptr += "</html>\n";
  return ptr;
}
