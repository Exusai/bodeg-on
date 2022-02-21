// Auto-generated. Do not edit!

// (in-package unity_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CamImgs = require('../msg/CamImgs.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ImgservRequest {
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
        this.input = new CamImgs();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImgservRequest
    // Serialize message field [input]
    bufferOffset = CamImgs.serialize(obj.input, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImgservRequest
    let len;
    let data = new ImgservRequest(null);
    // Deserialize message field [input]
    data.input = CamImgs.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += CamImgs.getMessageSize(object.input);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'unity_msgs/ImgservRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'badfc6aaa7dbc980e1e6dc824f968108';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    CamImgs input
    
    ================================================================================
    MSG: unity_msgs/CamImgs
    Header header
    string format
    uint8[] data
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImgservRequest(null);
    if (msg.input !== undefined) {
      resolved.input = CamImgs.Resolve(msg.input)
    }
    else {
      resolved.input = new CamImgs()
    }

    return resolved;
    }
};

class ImgservResponse {
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
        this.output = new CamImgs();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImgservResponse
    // Serialize message field [output]
    bufferOffset = CamImgs.serialize(obj.output, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImgservResponse
    let len;
    let data = new ImgservResponse(null);
    // Deserialize message field [output]
    data.output = CamImgs.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += CamImgs.getMessageSize(object.output);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'unity_msgs/ImgservResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aaafdd51e0c18cef005480ae2aaeb278';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    CamImgs output
    
    ================================================================================
    MSG: unity_msgs/CamImgs
    Header header
    string format
    uint8[] data
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImgservResponse(null);
    if (msg.output !== undefined) {
      resolved.output = CamImgs.Resolve(msg.output)
    }
    else {
      resolved.output = new CamImgs()
    }

    return resolved;
    }
};

module.exports = {
  Request: ImgservRequest,
  Response: ImgservResponse,
  md5sum() { return '2756544b56553ab47e7b3ef7356d02a3'; },
  datatype() { return 'unity_msgs/Imgserv'; }
};
