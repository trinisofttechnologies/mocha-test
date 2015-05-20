Meteor.publish 'candidates', ->
  if @userId

    self = this
    # a dictionary of match_id to matched user
    usersByCandidate = {}
    initializing = true
    handle = Candidates.find({ "userId" : @userId }).observeChanges
      added: (candidateId) ->
        if !initializing
          candidate = Candidates.findOne candidateId
          user = Meteor.users.findOne candidate.userId
          self.added 'candidates', candidateId, candidate
          self.added 'users', user._id, user
          usersByCandidate[candidateId] = user._id
      removed: (candidateId) ->
        if !initializing && usersByCandidate[candidateId]?
          self.removed 'candidates', candidateId
          self.removed 'users', usersByCandidate[candidateId]
          delete usersByCandidate[candidateId]

    initializing = false
    currentCandidates = Candidates.find({
      "userId" : @userId
    }).fetch()

    currentCandidates.forEach (candidate) ->
      console.log candidate
      user = Meteor.users.findOne candidate.userId
      self.added 'candidates', candidate._id, candidate
      self.added 'users', user._id, user
      usersByCandidate[candidate._id] = user._id

    self.ready()
    @onStop ->
      handle.stop()