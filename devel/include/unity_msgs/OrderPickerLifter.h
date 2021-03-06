// Generated by gencpp from file unity_msgs/OrderPickerLifter.msg
// DO NOT EDIT!


#ifndef UNITY_MSGS_MESSAGE_ORDERPICKERLIFTER_H
#define UNITY_MSGS_MESSAGE_ORDERPICKERLIFTER_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace unity_msgs
{
template <class ContainerAllocator>
struct OrderPickerLifter_
{
  typedef OrderPickerLifter_<ContainerAllocator> Type;

  OrderPickerLifter_()
    : lifterHeight(0.0)  {
    }
  OrderPickerLifter_(const ContainerAllocator& _alloc)
    : lifterHeight(0.0)  {
  (void)_alloc;
    }



   typedef float _lifterHeight_type;
  _lifterHeight_type lifterHeight;





  typedef boost::shared_ptr< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> const> ConstPtr;

}; // struct OrderPickerLifter_

typedef ::unity_msgs::OrderPickerLifter_<std::allocator<void> > OrderPickerLifter;

typedef boost::shared_ptr< ::unity_msgs::OrderPickerLifter > OrderPickerLifterPtr;
typedef boost::shared_ptr< ::unity_msgs::OrderPickerLifter const> OrderPickerLifterConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::unity_msgs::OrderPickerLifter_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::unity_msgs::OrderPickerLifter_<ContainerAllocator1> & lhs, const ::unity_msgs::OrderPickerLifter_<ContainerAllocator2> & rhs)
{
  return lhs.lifterHeight == rhs.lifterHeight;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::unity_msgs::OrderPickerLifter_<ContainerAllocator1> & lhs, const ::unity_msgs::OrderPickerLifter_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace unity_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6763d9c3a4d73a57831d19dcb37daf6a";
  }

  static const char* value(const ::unity_msgs::OrderPickerLifter_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6763d9c3a4d73a57ULL;
  static const uint64_t static_value2 = 0x831d19dcb37daf6aULL;
};

template<class ContainerAllocator>
struct DataType< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
{
  static const char* value()
  {
    return "unity_msgs/OrderPickerLifter";
  }

  static const char* value(const ::unity_msgs::OrderPickerLifter_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 lifterHeight\n"
;
  }

  static const char* value(const ::unity_msgs::OrderPickerLifter_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.lifterHeight);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OrderPickerLifter_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::unity_msgs::OrderPickerLifter_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::unity_msgs::OrderPickerLifter_<ContainerAllocator>& v)
  {
    s << indent << "lifterHeight: ";
    Printer<float>::stream(s, indent + "  ", v.lifterHeight);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UNITY_MSGS_MESSAGE_ORDERPICKERLIFTER_H
