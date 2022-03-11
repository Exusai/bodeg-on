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

class ArmTarget {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xTarget = null;
      this.yTarget = null;
      this.zTarget = null;
      this.grabAngle = null;
    }
    else {
      if (initObj.hasOwnProperty('xTarget')) {
        this.xTarget = initObj.xTarget
      }
      else {
        this.xTarget = 0.0;
      }
      if (initObj.hasOwnProperty('yTarget')) {
        this.yTarget = initObj.yTarget
      }
      else {
        this.yTarget = 0.0;
      }
      if (initObj.hasOwnProperty('zTarget')) {
        this.zTarget = initObj.zTarget
      }
      else {
        this.zTarget = 0.0;
      }
      if (initObj.hasOwnProperty('grabAngle')) {
        this.grabAngle = initObj.grabAngle
      }
      else {
        this.grabAngle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArmTarget
    // Serialize message field [xTarget]
    bufferOffset = _serializer.float32(obj.xTarget, buffer, bufferOffset);
    // Serialize message field [yTarget]
    bufferOffset = _serializer.float32(obj.yTarget, buffer, bufferOffset);
    // Serialize message field [zTarget]
    bufferOffset = _serializer.float32(obj.zTarget, buffer, bufferOffset);
    // Serialize message field [grabAngle]
    bufferOffset = _serializer.float32(obj.grabAngle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArmTarget
    let len;
    let data = new ArmTarget(null);
    // Deserialize message field [xTarget]
    data.xTarget = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yTarget]
    data.yTarget = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zTarget]
    data.zTarget = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [grabAngle]
    data.grabAngle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_msgs/ArmTarget';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5bd81dd8154876a58e80e524a6eefe6e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 xTarget
    float32 yTarget
    float32 zTarget
    float32 grabAngle
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArmTarget(null);
    if (msg.xTarget !== undefined) {
      resolved.xTarget = msg.xTarget;
    }
    else {
      resolved.xTarget = 0.0
    }

    if (msg.yTarget !== undefined) {
      resolved.yTarget = msg.yTarget;
    }
    else {
      resolved.yTarget = 0.0
    }

    if (msg.zTarget !== undefined) {
      resolved.zTarget = msg.zTarget;
    }
    else {
      resolved.zTarget = 0.0
    }

    if (msg.grabAngle !== undefined) {
      resolved.grabAngle = msg.grabAngle;
    }
    else {
      resolved.grabAngle = 0.0
    }

    return resolved;
    }
};

module.exports = ArmTarget;
