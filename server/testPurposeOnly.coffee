Meteor.methods({
  "clearDB": -> 
    Meteor.users.remove({});
    Candidates.remove({});
  
});