class PlayerQuery
  def initialize(tourneyID:, darterName:)
    @darterName = darterName
    @tourneyID = tourneyID

  end

  def relation
    
    Darter
      .where(name: @dartnerName)
      .where(tournament_id: @tourneyID)
  end
end
