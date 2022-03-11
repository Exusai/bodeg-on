// Auto-generated. Do not edit!

// (in-package unity_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class OrderPickerDirection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.orderPickerDirection = null;
    }
    else {
      if (initObj.hasOwnProperty('orderPickerDirection')) {
        this.orderPickerDirection = initObj.orderPickerDirection
      }
      else {
        this.orderPickerDirection = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OrderPickerDirection
    // Serialize message field [orderPickerDirection]
    bufferOffset = _serializer.float32(obj.orderPickerDirection, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OrderPickerDirection
    let len;
    let data = new OrderPickerDirection(null);
    // Deserialize message field [orderPickerDirection]
    data.orderPickerDirection = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_msgs/OrderPickerDirection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '83553efb863f0e36f94f0d60ee9c10ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 orderPickerDirection
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OrderPickerDirection(null);
    if (msg.orderPickerDirection !== undefined) {
      resolved.orderPickerDirection = msg.orderPickerDirection;
    }
    else {
      resolved.orderPickerDirection = 0.0
    }

    return resolved;
    }
};

module.exports = OrderPickerDirection;
