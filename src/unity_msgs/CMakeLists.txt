cmake_minimum_required(VERSION 3.0.2)
project(unity_msgs)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  geometry_msgs
  message_generation
)

add_message_files(FILES
    ArmPose.msg
    OrderPickerPosition.msg
    CamImgs.msg
)
add_service_files(FILES
    Pose.srv
	Position.srv
  Imgserv.srv
)

generate_messages(
  DEPENDENCIES
  geometry_msgs
  std_msgs
)

catkin_package(CATKIN_DEPENDS
    message_runtime)

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_robotics_demo.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)