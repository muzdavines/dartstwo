class TradeviewsController < ApplicationController
  before_action :set_tradeview, only: [:show, :edit, :update, :destroy]

  # GET /tradeviews
  # GET /tradeviews.json
  def index
    @tradeviews = Tradeview.all
  end

  # GET /tradeviews/1
  # GET /tradeviews/1.json
  def show
  end

  # GET /tradeviews/new
  def new
    @tradeview = Tradeview.new
  end

  # GET /tradeviews/1/edit
  def edit
  end

  # POST /tradeviews
  # POST /tradeviews.json
  def create
    @tradeview = Tradeview.new(tradeview_params)

    respond_to do |format|
      if @tradeview.save
        format.html { redirect_to @tradeview, notice: 'Tradeview was successfully created.' }
        format.json { render :show, status: :created, location: @tradeview }
      else
        format.html { render :new }
        format.json { render json: @tradeview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tradeviews/1
  # PATCH/PUT /tradeviews/1.json
  def update
    respond_to do |format|
      if @tradeview.update(tradeview_params)
        format.html { redirect_to @tradeview, notice: 'Tradeview was successfully updated.' }
        format.json { render :show, status: :ok, location: @tradeview }
      else
        format.html { render :edit }
        format.json { render json: @tradeview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tradeviews/1
  # DELETE /tradeviews/1.json
  def destroy
    @tradeview.destroy
    respond_to do |format|
      format.html { redirect_to tradeviews_url, notice: 'Tradeview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tradeview
      @tradeview = Tradeview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tradeview_params
      params.fetch(:tradeview, {})
    end
end
