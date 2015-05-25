
if typeof MochaWeb != 'undefined' and MochaWeb != null
  MochaWeb.testOnly ->
    describe 'Server', ->
      describe 'firstTest', ->
        Meteor.users.remove {}
        chai.assert.equal Meteor.users.find().count(), 0