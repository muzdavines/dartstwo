class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      flash[:notice] = "Tournament created successfully"
      redirect_to(tournaments_path)
    else
      render('new')
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(tournament_params)
      flash[:notice] = "Tournament created successfully"
      redirect_to(tournaments_path(@tournament))
    else
      render('edit')
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def delete
    @tournament = Tournament.find(params[:id])
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    flash[:notice] = "Tournament '#{@tournament.name}' destroyed successfully"
    redirect_to(tournaments_path)
  end
  helper_method :round_total
  private

    def tournament_params
      params.require(:tournament).permit(:name, :date, :fantasy_winner, :darts_winner)
    end

    def round_total(thisRound)
      if (thisRound["180"] == nil)
        thisRound["180"] = 0
      end
      score = (thisRound["180"]*3)+(thisRound["140"]*1)+(thisRound["170"]*5)+(thisRound["ton_plus"]*3)+(thisRound["9_dart"]*50)+(thisRound["legs"]*0.5)

      return score
    end



  end
