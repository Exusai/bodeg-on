// Generated by gencpp from file unity_msgs/ImgservRequest.msg
// DO NOT EDIT!


#ifndef UNITY_MSGS_MESSAGE_IMGSERVREQUEST_H
#define UNITY_MSGS_MESSAGE_IMGSERVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <unity_msgs/CamImgs.h>

namespace unity_msgs
{
template <class ContainerAllocator>
struct ImgservRequest_
{
  typedef ImgservRequest_<ContainerAllocator> Type;

  ImgservRequest_()
    : input()  {
    }
  ImgservRequest_(const ContainerAllocator& _alloc)
    : input(_alloc)  {
  (void)_alloc;
    }



   typedef  ::unity_msgs::CamImgs_<ContainerAllocator>  _input_type;
  _input_type input;





  typedef boost::shared_ptr< ::unity_msgs::ImgservRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::unity_msgs::ImgservRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ImgservRequest_

typedef ::unity_msgs::ImgservRequest_<std::allocator<void> > ImgservRequest;

typedef boost::shared_ptr< ::unity_msgs::ImgservRequest > ImgservRequestPtr;
typedef boost::shared_ptr< ::unity_msgs::ImgservRequest const> ImgservRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::unity_msgs::ImgservRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::unity_msgs::ImgservRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::unity_msgs::ImgservRequest_<ContainerAllocator1> & lhs, const ::unity_msgs::ImgservRequest_<ContainerAllocator2> & rhs)
{
  return lhs.input == rhs.input;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::unity_msgs::ImgservRequest_<ContainerAllocator1> & lhs, const ::unity_msgs::ImgservRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace unity_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::unity_msgs::ImgservRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unity_msgs::ImgservRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unity_msgs::ImgservRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "badfc6aaa7dbc980e1e6dc824f968108";
  }

  static const char* value(const ::unity_msgs::ImgservRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbadfc6aaa7dbc980ULL;
  static const uint64_t static_value2 = 0xe1e6dc824f968108ULL;
};

template<class ContainerAllocator>
struct DataType< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "unity_msgs/ImgservRequest";
  }

  static const char* value(const ::unity_msgs::ImgservRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "CamImgs input\n"
"\n"
"================================================================================\n"
"MSG: unity_msgs/CamImgs\n"
"Header header\n"
"string format\n"
"uint8[] data\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::unity_msgs::ImgservRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.input);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ImgservRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::unity_msgs::ImgservRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::unity_msgs::ImgservRequest_<ContainerAllocator>& v)
  {
    s << indent << "input: ";
    s << std::endl;
    Printer< ::unity_msgs::CamImgs_<ContainerAllocator> >::stream(s, indent + "  ", v.input);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UNITY_MSGS_MESSAGE_IMGSERVREQUEST_H
