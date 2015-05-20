Meteor.methods({
  "clearDB": function(){
    Meteor.users.remove({});
    Candidates.remove({});
  }
});