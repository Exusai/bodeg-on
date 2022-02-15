// Auto-generated. Do not edit!

// (in-package unity_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let OrderPickerPosition = require('../msg/OrderPickerPosition.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PositionRequest {
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
        this.input = new OrderPickerPosition();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PositionRequest
    // Serialize message field [input]
    bufferOffset = OrderPickerPosition.serialize(obj.input, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionRequest
    let len;
    let data = new PositionRequest(null);
    // Deserialize message field [input]
    data.input = OrderPickerPosition.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'unity_msgs/PositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f8e4a2d3805052790871d9acbcc92af5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    OrderPickerPosition input
    
    ================================================================================
    MSG: unity_msgs/OrderPickerPosition
    float32 pos_x
    float32 pos_y
    float32 pos_z
    float32 rot_x
    float32 rot_y
    float32 rot_z
    float32 rot_w
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PositionRequest(null);
    if (msg.input !== undefined) {
      resolved.input = OrderPickerPosition.Resolve(msg.input)
    }
    else {
      resolved.input = new OrderPickerPosition()
    }

    return resolved;
    }
};

class PositionResponse {
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
        this.output = new OrderPickerPosition();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PositionResponse
    // Serialize message field [output]
    bufferOffset = OrderPickerPosition.serialize(obj.output, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionResponse
    let len;
    let data = new PositionResponse(null);
    // Deserialize message field [output]
    data.output = OrderPickerPosition.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'unity_msgs/PositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f40a8c9d0d5d19208415bd9f23e5aa3f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    OrderPickerPosition output
    
    ================================================================================
    MSG: unity_msgs/OrderPickerPosition
    float32 pos_x
    float32 pos_y
    float32 pos_z
    float32 rot_x
    float32 rot_y
    float32 rot_z
    float32 rot_w
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PositionResponse(null);
    if (msg.output !== undefined) {
      resolved.output = OrderPickerPosition.Resolve(msg.output)
    }
    else {
      resolved.output = new OrderPickerPosition()
    }

    return resolved;
    }
};

module.exports = {
  Request: PositionRequest,
  Response: PositionResponse,
  md5sum() { return '5190f887b70decc2fafe0ae2939b233a'; },
  datatype() { return 'unity_msgs/Position'; }
};
