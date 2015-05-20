Meteor.subscribe 'candidates'

Template.candidates.helpers
  currentUser: ->
    Meteor.user()

  allCandidates: ->
    Candidates.find().fetch()

Template.add.events
  'click .save-name': (event)->
    name = $(event.target).next('.name').val()
    Meteor.call 'user/candidate/add', name
    return false
