class RoundsController < ApplicationController
  def index
    @rounds = Round.all
    @darter = Darter.find(params[:darterID])
  end

  def show
    @round = Round.find(params[:id])
  end

  def new
    @darter = Darter.find(params[:darterID])
    @round = Round.new
    @round.darter_id = @darter.id
  end

  def create
    @round = Round.new(round_params)
    @darter = Darter.find(params[:darterID])

    if @round.save
      flash[:notice] = "Round created successfully"
      redirect_to(rounds_path(:darterID => @darter.id, :tournamentID => @darter.player.tournament.id))
    else
      render('show')
    end
  end

  def update
    @round = Round.find(params[:id])
    if @round.update_attributes(round_params)
      flash[:notice] = "Round updated successfully"
      redirect_to(rounds_path(@round))
    else
      render('edit')
    end
  end

  def edit
    @round = Round.find(params[:id])
  end

  def delete
    @darter = Darter.find(params[:darterID])
    @round = Round.find(params[:id])
    destroy(@darter.id)
  end

  def destroy(darterID)
    @round = Round.find(params[:id])
    @darter = Darter.find(darterID)
    @round.destroy
    flash[:notice] = "Round '#{@round.name}' destroyed successfully"
    redirect_to(rounds_path(:darterID => @darter.id))
  end
  helper_method :round_total
  private

    def round_params
      params.require(:round).permit(:darter_id, :champion, :win, "180", "140", "170", "ton_plus", "9_dart", "legs", "score", "name")
    end
    def round_total(thisRound)
      score = (thisRound["180"]*3)+(thisRound["140"]*1)+(thisRound["170"]*5)+(thisRound["ton_plus"]*3)+(thisRound["9_dart"]*50)+(thisRound["legs"]*0.5)
      
      return score
    end
end
