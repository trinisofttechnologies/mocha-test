currentUser = {
  "_id": "nicolsondsouza",
  "name": "Nicolson Dsouza",
  "username": "nicolsondsouza",
  "password": "123456"
}

dummyUser1 = {
  "_id": "hastenf",
  "name": "Hasten Fernandez"
}


MochaWeb?.testOnly ()->
   # MochaWeb.testOnly(function() {
  describe "Client", ()-> 

    # 1) start the server
    describe "firstTest", ()-> 
      before (done)-> 
        
        # 2) subscribe with the client
        Meteor.subscribe("candidates")
        Meteor.call "clearDB", ()-> 
          
          # created user as the work flow is authenticated based
          Accounts.createUser currentUser, (err, success)-> 
            # console.log(err, success)
            # 3) call api method 'user/candidate/add'
            Meteor.call "user/candidate/add", dummyUser1.name, ()-> 
              done(); 
      it "has dom name "+dummyUser1.name, ()-> 
        # 4) verify that candidate and user info get published to the client.
        chai.assert.equal Meteor.users.find({"name": dummyUser1.name}).count(), 1