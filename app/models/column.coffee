Spine = require('spine')

class Column extends Spine.Model
  @configure 'Column', 'title'

  @extend Spine.Model.Local

module.exports = Column