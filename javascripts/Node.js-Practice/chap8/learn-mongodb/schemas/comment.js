const mongoose = require('mongoose');

const { Schema } = mongoose;

const { Types: { ObjectId } } = Schema; //
const commentSchema = new Schema({
  commenter: {
    type: ObjectId, //사용자의 id
    required: true,
    ref: 'User',
  },
  comment: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model('Comment', commentSchema);
