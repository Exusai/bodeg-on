// Generated by gencpp from file unity_msgs/PoseRequest.msg
// DO NOT EDIT!


#ifndef UNITY_MSGS_MESSAGE_POSEREQUEST_H
#define UNITY_MSGS_MESSAGE_POSEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <unity_msgs/ArmPose.h>

namespace unity_msgs
{
template <class ContainerAllocator>
struct PoseRequest_
{
  typedef PoseRequest_<ContainerAllocator> Type;

  PoseRequest_()
    : input()  {
    }
  PoseRequest_(const ContainerAllocator& _alloc)
    : input(_alloc)  {
  (void)_alloc;
    }



   typedef  ::unity_msgs::ArmPose_<ContainerAllocator>  _input_type;
  _input_type input;





  typedef boost::shared_ptr< ::unity_msgs::PoseRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::unity_msgs::PoseRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PoseRequest_

typedef ::unity_msgs::PoseRequest_<std::allocator<void> > PoseRequest;

typedef boost::shared_ptr< ::unity_msgs::PoseRequest > PoseRequestPtr;
typedef boost::shared_ptr< ::unity_msgs::PoseRequest const> PoseRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::unity_msgs::PoseRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::unity_msgs::PoseRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::unity_msgs::PoseRequest_<ContainerAllocator1> & lhs, const ::unity_msgs::PoseRequest_<ContainerAllocator2> & rhs)
{
  return lhs.input == rhs.input;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::unity_msgs::PoseRequest_<ContainerAllocator1> & lhs, const ::unity_msgs::PoseRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace unity_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::unity_msgs::PoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::unity_msgs::PoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unity_msgs::PoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unity_msgs::PoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unity_msgs::PoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unity_msgs::PoseRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::unity_msgs::PoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bad8e0c81e6e167c6af72ff81e1b124f";
  }

  static const char* value(const ::unity_msgs::PoseRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbad8e0c81e6e167cULL;
  static const uint64_t static_value2 = 0x6af72ff81e1b124fULL;
};

template<class ContainerAllocator>
struct DataType< ::unity_msgs::PoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "unity_msgs/PoseRequest";
  }

  static const char* value(const ::unity_msgs::PoseRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::unity_msgs::PoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ArmPose input\n"
"\n"
"================================================================================\n"
"MSG: unity_msgs/ArmPose\n"
"float32 q1\n"
"float32 q2\n"
"float32 q3\n"
"float32 d4\n"
"float32 q5\n"
"float32 succ\n"
;
  }

  static const char* value(const ::unity_msgs::PoseRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::unity_msgs::PoseRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.input);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PoseRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::unity_msgs::PoseRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::unity_msgs::PoseRequest_<ContainerAllocator>& v)
  {
    s << indent << "input: ";
    s << std::endl;
    Printer< ::unity_msgs::ArmPose_<ContainerAllocator> >::stream(s, indent + "  ", v.input);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UNITY_MSGS_MESSAGE_POSEREQUEST_H
