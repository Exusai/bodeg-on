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

class ArmPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.q1 = null;
      this.q2 = null;
      this.q3 = null;
      this.d4 = null;
      this.q5 = null;
      this.succ = null;
    }
    else {
      if (initObj.hasOwnProperty('q1')) {
        this.q1 = initObj.q1
      }
      else {
        this.q1 = 0.0;
      }
      if (initObj.hasOwnProperty('q2')) {
        this.q2 = initObj.q2
      }
      else {
        this.q2 = 0.0;
      }
      if (initObj.hasOwnProperty('q3')) {
        this.q3 = initObj.q3
      }
      else {
        this.q3 = 0.0;
      }
      if (initObj.hasOwnProperty('d4')) {
        this.d4 = initObj.d4
      }
      else {
        this.d4 = 0.0;
      }
      if (initObj.hasOwnProperty('q5')) {
        this.q5 = initObj.q5
      }
      else {
        this.q5 = 0.0;
      }
      if (initObj.hasOwnProperty('succ')) {
        this.succ = initObj.succ
      }
      else {
        this.succ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArmPose
    // Serialize message field [q1]
    bufferOffset = _serializer.float32(obj.q1, buffer, bufferOffset);
    // Serialize message field [q2]
    bufferOffset = _serializer.float32(obj.q2, buffer, bufferOffset);
    // Serialize message field [q3]
    bufferOffset = _serializer.float32(obj.q3, buffer, bufferOffset);
    // Serialize message field [d4]
    bufferOffset = _serializer.float32(obj.d4, buffer, bufferOffset);
    // Serialize message field [q5]
    bufferOffset = _serializer.float32(obj.q5, buffer, bufferOffset);
    // Serialize message field [succ]
    bufferOffset = _serializer.float32(obj.succ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArmPose
    let len;
    let data = new ArmPose(null);
    // Deserialize message field [q1]
    data.q1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q2]
    data.q2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q3]
    data.q3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d4]
    data.d4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q5]
    data.q5 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [succ]
    data.succ = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_msgs/ArmPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ffea4f3e3644005bdf0b21e3a7766cb5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 q1
    float32 q2
    float32 q3
    float32 d4
    float32 q5
    float32 succ
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArmPose(null);
    if (msg.q1 !== undefined) {
      resolved.q1 = msg.q1;
    }
    else {
      resolved.q1 = 0.0
    }

    if (msg.q2 !== undefined) {
      resolved.q2 = msg.q2;
    }
    else {
      resolved.q2 = 0.0
    }

    if (msg.q3 !== undefined) {
      resolved.q3 = msg.q3;
    }
    else {
      resolved.q3 = 0.0
    }

    if (msg.d4 !== undefined) {
      resolved.d4 = msg.d4;
    }
    else {
      resolved.d4 = 0.0
    }

    if (msg.q5 !== undefined) {
      resolved.q5 = msg.q5;
    }
    else {
      resolved.q5 = 0.0
    }

    if (msg.succ !== undefined) {
      resolved.succ = msg.succ;
    }
    else {
      resolved.succ = 0.0
    }

    return resolved;
    }
};

module.exports = ArmPose;
