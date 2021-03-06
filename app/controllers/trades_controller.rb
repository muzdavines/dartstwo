require ('csv')
class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  layout 'sidenav'
  def sidenav

  end
  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)
    @trade.offerer_email = User.find(session[:user_id]).email
      if (@trade.save)
        NotifierMailer.newtrade(@trade).deliver_now
        flash.now[:notice] = "Trade was successfully sent."
        id = @trade.id
        CSV.open("#{id}trade.csv", "wb") do |csv|
            @trade.attributes.each do |name, value|
            csv << [name, value]
            end
          
          end

        redirect_to posttrade_trade_path(id: @trade.id)
      else
        render :new
      end
    end
    def posttrade
      @trade_id = params[:id]
    end
    def download
      id = params[:id]
      send_file "#{id}trade.csv"
    end
  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.fetch(:trade, {})
      params.require(:trade).permit(:transDirection, :iso, :loc, :settlement, :product, :start_date, :end_date, :mw_peak, :mw_wrap, :price_peak, :price_wrap, :term, :offerer_email, :offeree_email, :offerer_id, :offeree_id)
    end
end
