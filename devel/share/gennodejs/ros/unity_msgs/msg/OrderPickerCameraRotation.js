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

class OrderPickerCameraRotation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.orderPickerCameraRotation = null;
    }
    else {
      if (initObj.hasOwnProperty('orderPickerCameraRotation')) {
        this.orderPickerCameraRotation = initObj.orderPickerCameraRotation
      }
      else {
        this.orderPickerCameraRotation = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OrderPickerCameraRotation
    // Serialize message field [orderPickerCameraRotation]
    bufferOffset = _serializer.float32(obj.orderPickerCameraRotation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OrderPickerCameraRotation
    let len;
    let data = new OrderPickerCameraRotation(null);
    // Deserialize message field [orderPickerCameraRotation]
    data.orderPickerCameraRotation = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_msgs/OrderPickerCameraRotation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd0b74d1f759a1fb713ba4af444bedb4b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 orderPickerCameraRotation
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OrderPickerCameraRotation(null);
    if (msg.orderPickerCameraRotation !== undefined) {
      resolved.orderPickerCameraRotation = msg.orderPickerCameraRotation;
    }
    else {
      resolved.orderPickerCameraRotation = 0.0
    }

    return resolved;
    }
};

module.exports = OrderPickerCameraRotation;
