class DartersController < ApplicationController
  def index
    @darters = Darter.all
  end

  def show
    @darter = Darter.find(params[:id])
  end

  def new
    @tournament = Tournament.find(params[:tournamentID])
    @darter = Darter.new
  end

  def create
    @darter = Darter.new(darter_params)
    @tournament = Tournament.find(params[:tournamentID])
    if @darter.save
      flash[:notice] = "Darter created successfully"
      redirect_to(new_darter_path(:tournamentID=>@tournament.id))
    else
      render('new')
    end
  end

  def update
    @darter = Darter.find(params[:id])
    if @darter.update_attributes(darter_params)
      flash[:notice] = "Darter updated successfully"
      redirect_to(darters_path(@darter))
    else
      render('edit')
    end
  end

  def edit
    @darter = Darter.find(params[:id])
  end

  def delete
    @darter = Darter.find(params[:id])
    @tournament = Tournament.find(params[:tournamentID])
  end

  def destroy
    @tournament = Tournament.find(params[:tournamentID])
    @darter = Darter.find(params[:id])
    @darter.destroy
    flash[:notice] = "Darter '#{@darter.name}' destroyed successfully"
    redirect_to(new_darter_path(:tournamentID=>@tournament.id))
  end

  private

    def darter_params
      params.require(:darter).permit(:player_id, :name, :seed, :alive, :rounds, :total_points)
    end

end
