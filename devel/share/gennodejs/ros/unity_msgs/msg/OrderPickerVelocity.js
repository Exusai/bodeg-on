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

class OrderPickerVelocity {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.orderPickerSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('orderPickerSpeed')) {
        this.orderPickerSpeed = initObj.orderPickerSpeed
      }
      else {
        this.orderPickerSpeed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OrderPickerVelocity
    // Serialize message field [orderPickerSpeed]
    bufferOffset = _serializer.float32(obj.orderPickerSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OrderPickerVelocity
    let len;
    let data = new OrderPickerVelocity(null);
    // Deserialize message field [orderPickerSpeed]
    data.orderPickerSpeed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_msgs/OrderPickerVelocity';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b771032ad1d53adf5c692218acbd5c7b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 orderPickerSpeed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OrderPickerVelocity(null);
    if (msg.orderPickerSpeed !== undefined) {
      resolved.orderPickerSpeed = msg.orderPickerSpeed;
    }
    else {
      resolved.orderPickerSpeed = 0.0
    }

    return resolved;
    }
};

module.exports = OrderPickerVelocity;
