// Auto-generated. Do not edit!

// (in-package hebi_motor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class custom_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num_float = null;
    }
    else {
      if (initObj.hasOwnProperty('num_float')) {
        this.num_float = initObj.num_float
      }
      else {
        this.num_float = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type custom_msg
    // Serialize message field [num_float]
    bufferOffset = _serializer.float64(obj.num_float, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type custom_msg
    let len;
    let data = new custom_msg(null);
    // Deserialize message field [num_float]
    data.num_float = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hebi_motor/custom_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b62cff7d3666b686e1901448794166aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 num_float
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new custom_msg(null);
    if (msg.num_float !== undefined) {
      resolved.num_float = msg.num_float;
    }
    else {
      resolved.num_float = 0.0
    }

    return resolved;
    }
};

module.exports = custom_msg;
