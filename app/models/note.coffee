Spine = require('spine')

class Note extends Spine.Model
  @configure 'Note', 'color', 'content', 'w', 'h', 'x', 'y'

  @extend @Local

module.exports = Note