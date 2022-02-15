// Auto-generated. Do not edit!

// (in-package unity_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ArmPose = require('../msg/ArmPose.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PoseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input = null;
    }
    else {
      if (initObj.hasOwnProperty('input')) {
        this.input = initObj.input
      }
      else {
        this.input = new ArmPose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PoseRequest
    // Serialize message field [input]
    bufferOffset = ArmPose.serialize(obj.input, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PoseRequest
    let len;
    let data = new PoseRequest(null);
    // Deserialize message field [input]
    data.input = ArmPose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'unity_msgs/PoseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bad8e0c81e6e167c6af72ff81e1b124f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ArmPose input
    
    ================================================================================
    MSG: unity_msgs/ArmPose
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
    const resolved = new PoseRequest(null);
    if (msg.input !== undefined) {
      resolved.input = ArmPose.Resolve(msg.input)
    }
    else {
      resolved.input = new ArmPose()
    }

    return resolved;
    }
};

class PoseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output = null;
    }
    else {
      if (initObj.hasOwnProperty('output')) {
        this.output = initObj.output
      }
      else {
        this.output = new ArmPose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PoseResponse
    // Serialize message field [output]
    bufferOffset = ArmPose.serialize(obj.output, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PoseResponse
    let len;
    let data = new PoseResponse(null);
    // Deserialize message field [output]
    data.output = ArmPose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'unity_msgs/PoseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0689e36df5d12b3591755de018d79aad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ArmPose output
    
    ================================================================================
    MSG: unity_msgs/ArmPose
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
    const resolved = new PoseResponse(null);
    if (msg.output !== undefined) {
      resolved.output = ArmPose.Resolve(msg.output)
    }
    else {
      resolved.output = new ArmPose()
    }

    return resolved;
    }
};

module.exports = {
  Request: PoseRequest,
  Response: PoseResponse,
  md5sum() { return 'b83998b949202c6834b3ab9d4bd151b4'; },
  datatype() { return 'unity_msgs/Pose'; }
};
