Meteor.subscribe 'candidates'

Template.candidates.helpers
  currentUser: ->
    Meteor.user()

  allCandidates: ->
    users = []
    Candidates.find().fetch().forEach (candidate) ->
      users.push(Meteor.users.findOne(candidate.userId))
    return users

Template.add.events
  'click .save-name': (event)->
    name = $(event.target).next('.name').val()
    Meteor.call 'user/candidate/add', name
    return false
