# describe 'Api Methods', () ->
#   currentUserId = null;

#   beforeEach () ->
#     Meteor.users.remove({})
#     Candidates.remove({})

#     currentUserId = Meteor.users.insert
#       name: 'qiming'
#       email: 'fang@s10.tv'

#   it 'user/candidate/add should add a new candidate', () ->
#     Meteor.user = () ->
#       Meteor.users.findOne currentUserId

#     Meteor.call 'user/candidate/add', 'tony', (err, res) ->
#       candidates = Candidates.find().fetch()
#       expect(candidates.length).toBe(1)
#       expect(candidates[0].forUserId).toBe(currentUserId)

#       userId = candidates[0].userId
#       tony = Meteor.users.findOne userId
#       expect(tony.name).toBe('tony')

#   it 'user/candidate/add should not insert a candidate if no user is logged in', () ->
#     Meteor.user = () ->
#       null # no user is logged in

#     Meteor.call 'user/candidate/add', 'tony', (err, res) ->
#       candidates = Candidates.find().fetch()
#       expect(candidates.length).toBe(0)