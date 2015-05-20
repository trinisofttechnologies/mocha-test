Meteor.methods
  'user/candidate/add': (name) ->
    currentUser = Meteor.user()
    if currentUser?
      # create a new entry for this user
      newUserId = Meteor.users.insert
        name: name
      # insert this relationship into candidates collection
      Candidates.insert
        forUserId : currentUser._id
        userId : newUserId