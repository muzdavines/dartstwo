class PlayersController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournamentID])
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
    @tournament = Tournament.find(params[:tournamentID])
    @player.tournament_id = @tournament.id
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:notice] = "Player created successfully"
      redirect_to(tournament_path(@player.tournament_id))
    else
      render('edit')
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:notice] = "Player updated successfully"
      redirect_to(tournaments_path(@player.tournament_id))
    else
      render('edit')
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def delete
    @player = Player.find(params[:id])
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Player '#{@player.name}' destroyed successfully"
    redirect_to(players_path)
  end
  private

    def player_params
      params.require(:player).permit(:name, :total_points, :tournament_id)
    end
end
