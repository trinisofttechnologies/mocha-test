

if (typeof MochaWeb !== "undefined" && MochaWeb !== null) {
  MochaWeb.testOnly(function() {
    describe("Server", function() {
      describe("firstTest", function() {
      	Meteor.users.remove({});
      	chai.assert.equal(Meteor.users.find().count(),0);
      });
    });
  });
}

