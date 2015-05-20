var currentUser = {
  "_id": "nicolsondsouza",
  "name": "Nicolson Dsouza",
  "username": "nicolsondsouza",
  "password": "123456"
};

var dummyUser1 = {
  "_id": "hastenf",
  "name": "Hasten Fernandez"
};


if (typeof MochaWeb !== "undefined" && MochaWeb !== null) {
  MochaWeb.testOnly(function() {
    describe("Client", function() {

      // 1) start the server
      describe("firstTest", function() {
        before(function(done){
          
          // 2) subscribe with the client
          Meteor.subscribe("candidates")
          Meteor.call("clearDB",function(){
            
            // created user as the work flow is authenticated based
            Accounts.createUser(currentUser, function(err, success){
              
              // 3) call api method 'user/candidate/add'
              Meteor.call("user/candidate/add", dummyUser1.name, function(){
                done();  
              });
            });
          });
        });
        
        it("has dom name " +dummyUser1.name, function () {
          
          // 4) verify that candidate and user info get published to the client.
          chai.assert.equal($("ol li span:first").text(), dummyUser1.name);
        });
        
      });
    });
  });
}