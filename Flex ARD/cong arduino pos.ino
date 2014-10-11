  //Se cargan biliotecas
  #include <Wire.h>
  #include <Adafruit_MCP23017.h>
  #include <Adafruit_RGBLCDShield.h>
  #include <SoftwareSerial.h>
  
  //Se instancia el modulo de Display
  Adafruit_RGBLCDShield lcd = Adafruit_RGBLCDShield();
  
  //Se definen colores para el display
  #define OFF 0x0
  #define ON 0x1
  
  //Se conectan los pines de conexion del modulo Bluetooth
  SoftwareSerial BT(10,11); //10 RX, 11 TX.

  //Se define el LED de notificaciones
  int BluePin = 3;     
  boolean running = false;
  
  //SE definen estados de control;
  
  static int state = 0; // initial state is 0
  boolean displayRGB = false;
   
  String cadenaSerial = "";
  String cadenaBluetooth = "";
  String texto = "Flex P.O.S";
  char character;
   
  void setup(){
    
    BT.begin(9600); //Velocidad del puerto del módulo Bluetooth
    BT.flush();
    delay(500); 
    Serial.begin(9600); //Abrimos la comunicación serie con el PC y establecemos velocidad
    Serial.flush();
    
    // set up the LCD's number of columns and rows: 
    lcd.begin(16, 2);
    lcd.setBacklight(ON);
    lcd.print("Welcome Flex POS");
    
    pinMode(BluePin, OUTPUT);
    
    delay(1500);
  }
  
  void loop() {
    
    cadenaSerial = "";
    cadenaBluetooth = "";
    
    if(BT.available()){
      while(BT.available()){
        delay(2);
        character = BT.read();
        cadenaBluetooth.concat(character);
      }
    }else if(Serial.available()){    
      while(Serial.available()){
        delay(2);
        character = Serial.read();
        cadenaSerial.concat(character);
      } 
    }
    
    
    switch(state){
      
      case 0: // ESTAGO COBRO
            if(cadenaSerial.equals("Cobrar")){
              state = 1;
              displayRGB = false;      
            }else{
              if(changeDisplay()){
                lcd.clear();
                lcd.print("FLEX P.O.S");
                lcd.setCursor(0, 1);
                lcd.print("Modo Cobro");
              }        
              running = !running;            
              digitalWrite(BluePin, running);   
              delay(500);
            }    
            break;
            
      case 1: // ESTAGO PAGO
            if(cadenaBluetooth != ""){     
              Serial.println(cadenaBluetooth);
              state = 2;
              displayRGB = false;     
            }else if(cadenaSerial != ""){            
                lcd.clear();
                lcd.print("Modo Pago");
                lcd.setCursor(0, 1);
                lcd.print("Monto: "+cadenaSerial);      
            }else{
              if(changeDisplay()){
                lcd.clear();
                lcd.print(texto);
                lcd.setCursor(0, 1);
                lcd.print("Modo Pago");
              }        
              running = 1;            
              digitalWrite(BluePin, running);   
            }
            break;
            
      case 2: // ESTADO ESPERA
            if(cadenaSerial.equals("Exito")){     
              state = 0; 
              lcd.clear();
              lcd.print("Exito!!");
              lcd.setCursor(0, 1);
              lcd.print("=)");
              displayRGB = false;      
              tono();
              delay(3000);
            }else if(cadenaSerial.equals("Error")){
              state = 0; 
              lcd.clear();
              lcd.print("Error!!");
              lcd.setCursor(0, 1);
              lcd.print("x)");
              displayRGB = false;      
              tono();
              delay(3000);
            }else{
              if(changeDisplay()){
                lcd.clear();
                lcd.print("Por favor espere");
                lcd.setCursor(0, 1);
                lcd.print(".. procesando ..");
              }        
              running = !running;            
              digitalWrite(BluePin, running);   
              delay(150);
            }
            break;
      default:
            state = 0;
            break;
    } 
  }  

void tono(){
  
  int valor = 1600;
  int noteDuration = 300;
  tone(8,valor,noteDuration);
  int pauseBetweenNotes = noteDuration;
  delay(pauseBetweenNotes);
  noTone(8);
}

boolean changeDisplay(){
  
  if(displayRGB == false){
      displayRGB = true;
      return true;
  }
  return false;
}


