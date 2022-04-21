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

class GripperSuck {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.suck = null;
    }
    else {
      if (initObj.hasOwnProperty('suck')) {
        this.suck = initObj.suck
      }
      else {
        this.suck = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperSuck
    // Serialize message field [suck]
    bufferOffset = _serializer.float32(obj.suck, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperSuck
    let len;
    let data = new GripperSuck(null);
    // Deserialize message field [suck]
    data.suck = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_msgs/GripperSuck';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99e58236a92fed374f4db00fc52a88ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 suck
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperSuck(null);
    if (msg.suck !== undefined) {
      resolved.suck = msg.suck;
    }
    else {
      resolved.suck = 0.0
    }

    return resolved;
    }
};

module.exports = GripperSuck;
