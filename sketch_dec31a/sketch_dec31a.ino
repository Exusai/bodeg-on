#include <AccelStepper.h>

#define step1 6
#define dir1 7

// from the serial monitor we can toogle between the start and stop of the motor
// by pressing the key 's' or 'S' the motor will start rotating
// by pressing the key 'p' or 'P' the motor will stop rotating

// esta velocidad es en pasos por segundo y la aceleración igual esta en pasos por segundo*segundo 
float maxSpeed = 1000; // max speed for the stepper motors
float maxAccel = 500; // max acceleration for the stepper motors

AccelStepper stepper1(1, step1, dir1);

// pasos por vuelta
float steps = 200;

// numero de vueltas que hadado
float numberOfLaps = 0;

// nos indica si el motor debe parar o no
bool shouldStop = false;

// para controlar las ventosas
bool vacuum = false;
 
void setup() {
  // parametros del motor
  stepper1.setMaxSpeed(maxSpeed);
  stepper1.setAcceleration(maxAccel);
  stepper1.setCurrentPosition(0);

  // para el relay de las ventosas 
  pinMode(A0, OUTPUT);
  
  // serial monitor
  Serial.begin(9600);
}
/*
  s mueve el motor en sentido antihorario
  d mueve el motor en sentido horario
  p para el motor
  r reinicia el motor
  v activa el relay de las ventosas
  -----------------------------------------
  normalmente incias con s o d 
  las vueltas suelen poder contarse facilemente por que 
  el motor debe acelerar y descelerar por cada vuelta
  entonce paras el motor cuando sea necesario y cuando estes listo para 
  otra prueba aprietas r y estas listo para volver a presionar s o d
  (no olviden presionar enter cuando manden comandos)
    1.-   s -> esperar a que se mueva el numero de vueltas deseado -> p
    2.-   cuando quieran activar/desactivar las ventosas aprieten v
    3.-   despues de detener el motor reiniciar con r y listo para recibir s o d 
*/

void loop() {
  // read the serial monitor
  if (Serial.available() > 0) {
    char c = Serial.read();
    if (c == 's' || c == 'S') { // ese de subir
      // while p is not pressed, the motor will rotate
      // the nmber of rotations will be counted by the variable numberOfLaps
      while (shouldStop == false) {
        stepper1.move(-steps);
        stepper1.runToPosition();
        numberOfLaps++;
        // display number of laps 
        Serial.print("Number of laps: ");
        Serial.println(numberOfLaps);
        c = Serial.read();
        if (c == 'p' || c == 'P') {
          shouldStop = true;
          stepper1.stop();
          numberOfLaps = 0;
        }
      }
      
    }
    if (c == 'd' || c == 'D') {
      while (shouldStop == false) {
        stepper1.move(steps);
        stepper1.runToPosition();
        numberOfLaps++;
        // display number of laps 
        Serial.print("Number of laps: ");
        Serial.println(numberOfLaps);
        c = Serial.read();
        if (c == 'p' || c == 'P') {
          shouldStop = true;
          stepper1.stop();
          numberOfLaps = 0;
        }
      }
    }
    if (c == 'r' || c == 'R') {
      shouldStop = false;
    }

    if (c == 'v' || c == 'V') {
      if (vacuum == false) {
        digitalWrite(A0, HIGH);
        vacuum = true;
      } else {
        digitalWrite(A0, LOW);
        vacuum = false;
      }
    }
  }
}


