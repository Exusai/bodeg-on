#include <ros.h>
#include <std_msgs/Float32.h>>
#include <std_msgs/String.h>
#include <AccelStepper.h>


float maxSpeed = 500; // max speed for the stepper motors
float maxAccel = 200; // max acceleration for the stepper motors

// el primer motor va muy lento con respecto a los otros 2
// por eso se le asigna una velocidad y aceleracion mayor
float maxSpeed1 = 700;
float maxAccel1 = 400;

// every motor has its own gear ratio
float ratio1 = 31.4894;
float ratio2 = 1; // corresponds to how may rotations of the motor are needed to move 1m up or down .42cm por vuelta 
float ratio3 = 11.7649;
float ratio4 = 6;

// the number of steps per revolution for each motor
float stepsPerRev1 = 2105;
float stepsPerRev2 = 200; //37 vuelta max
float stepsPerRev3 = 2105;
float stepsPerRev4 = 2105;

// para controlar las ventosas
bool vacuum = false;

//parainiciar el ciclo desde ROS
bool shouldPerform = false;

// define the pins for the 4 stepper motors
#define step1 4     // primer motor (el que mueve todo)
#define dir1 5      // primer motor (el que mueve todo)
#define step2 6     // motor del husillo
#define dir2 7      // motor del husillo 
#define step3 8     // el motor que falta que esta entre el husillo y el ultimo motor
#define dir3 9      // el motor que falta que esta entre el husillo y el ultimo motor
#define step4 10    // motor del ultimo eslabon
#define dir4 11     // motor del ultimo eslabon

// define pin for emergency stop
// *** falta implmentar la parada de emergencia ***
#define stop 12

// valriable para determinar si es que se ha llegado a la posición objetivo
bool hasReachedDestination = false;
bool hasTakenBox = false;
bool hasRecivedFirstMessage = false;
int arrivedToDestinationCounter = 0;

// functions that takes a target in degrees and converts it to steps
// using the gear ratio and the number of steps per revolution
long targetToSteps(float target, float ratio, float stepsPerRev) {
  // steps should be (target * ratio * stepsPerRev) / 360 but we need to convert to long
  double stepsDouble = (target * ratio * stepsPerRev) / 360;
  // we need to round the number of steps to the nearest integer
  long steps = round(stepsDouble);
  return steps;
}

// function to read arm pose from the topic /arm_pose_target and set the target angles and height
void readE0Target(const std_msgs::Float32& msg) {
  //theta1 = msg.data;
  if (msg.data == 1.0){
    if(!hasRecivedFirstMessage) startPerform();
  }
}

void toogleVentosas(){
  if (vacuum == false) {
    digitalWrite(A0, HIGH);
    vacuum = true;
  } else {
    digitalWrite(A0, LOW);
    vacuum = false;
  }
}

// esta func se tiene que llamar desde ROS
void startPerform(){
  shouldPerform = true;
  hasRecivedFirstMessage = true;
}

// init stepper motors
AccelStepper stepper1(1, step1, dir1);
AccelStepper stepper2(1, step2, dir2);
AccelStepper stepper3(1, step3, dir3);
AccelStepper stepper4(1, step4, dir4);

ros::NodeHandle nh;
ros::Subscriber<std_msgs::Float32> sub1("arm_pose_target_re/q1", &readE0Target);
std_msgs::String str_msg;
ros::Publisher chatter("chatter", &str_msg);
char hello[13] = "done";

void setup() {
  nh.loginfo("Setup Start");
  nh.initNode();
  nh.subscribe(sub1);
  nh.advertise(chatter);
  nh.loginfo("Inicializando Arduino");
  // definimos maxima velocidad y aceleración para los motores 
  // de momento en único con velocidad y aceleración mayor es el
  // primermotor
  stepper1.setMaxSpeed(maxSpeed1);
  stepper1.setAcceleration(maxAccel1);
  stepper2.setMaxSpeed(maxSpeed);
  stepper2.setAcceleration(maxAccel);
  stepper3.setMaxSpeed(maxSpeed);
  stepper3.setAcceleration(maxAccel);
  stepper4.setMaxSpeed(maxSpeed);
  stepper4.setAcceleration(maxAccel);

  // les indicamos que la posición actual en la que se encuentran será el 0
  // de este modo siempre podemos regresar a la pose inicial
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
  stepper4.setCurrentPosition(0);

  // set the pin for the emergency stop as input
  pinMode(stop, INPUT);

  // ***********
  // a este código le hace falta incluir la activación / pines para las ventosas 
  // ***********
  pinMode(A0, OUTPUT);
  toogleVentosas();
  //delay(20000);
}

void loop() {
  nh.spinOnce();
  
  if (shouldPerform){
    // mientras no haya alcanzado la posición objetivo
    if (!hasReachedDestination){
      stepper1.moveTo(targetToSteps(-70.0, ratio1, stepsPerRev1)); // must move 100 deg on cw
      
      stepper3.moveTo(targetToSteps(-64.0, ratio3, stepsPerRev3)); // must move 74 deg ccw
      stepper4.moveTo(targetToSteps(-30, ratio4, stepsPerRev4)); // must move 26 ccw
    } else {
      // si ya la alcazó, volver a inicio
      // return to origin
      stepper1.moveTo(0);
      //stepper2.moveTo(0);
      stepper3.moveTo(0);
      stepper4.moveTo(0);
    }

    // en lugar de run se podría usar runToPosition
    // pero eso bloqueraria el loop hasta que se alcanzara la posición objetivo
    // y cada brazo se movería uno por uno
    // usar la función run nos permite mover todos los motores al mismo tiempo
    // rin bloquar el loop
    stepper1.run();
    stepper2.run();
    stepper3.run();
    stepper4.run();

    // if has reached the target position wait for 5 seconds and return to origin
    if (stepper1.distanceToGo() == 0 && stepper2.distanceToGo() == 0 && stepper3.distanceToGo() == 0 && stepper4.distanceToGo() == 0) {
      if(arrivedToDestinationCounter == 0) toogleVentosas();
      //delay(15000);
      stepper2.moveTo((37 * stepsPerRev2));
      stepper2.runToPosition();
      if(arrivedToDestinationCounter == 1) toogleVentosas();
      delay(3000);
      hasReachedDestination = !hasReachedDestination;
      hasTakenBox = !hasTakenBox;
      arrivedToDestinationCounter++;
      stepper2.moveTo(0);
      stepper2.runToPosition();
      //delay(3000);
    }

    if (arrivedToDestinationCounter == 2){
      shouldPerform = false;
      arrivedToDestinationCounter = 0;
      str_msg.data = hello;
      hasRecivedFirstMessage = false;
      chatter.publish( &str_msg );
    }
  }

}