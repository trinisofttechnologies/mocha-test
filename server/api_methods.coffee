Meteor.methods
  'user/candidate/add': (name) ->
    currentUser = Meteor.user()
    if currentUser?
      console.log "inserted #{currentUser._id} | name"
      Candidates.insert
        userId : currentUser._id
        name: name