class BookingDatesController < ApplicationController
  before_action :set_booking_date, only: [:show, :edit, :update, :destroy]

  # GET /booking_dates
  # GET /booking_dates.json
  def index
    @booking_dates = BookingDate.all
  end

  # GET /booking_dates/1
  # GET /booking_dates/1.json
  def show
  end

  # GET /booking_dates/new
  def new
    @booking_date = BookingDate.new
  end

  # GET /booking_dates/1/edit
  def edit
  end

  # POST /booking_dates
  # POST /booking_dates.json
  def create
    @booking_date = BookingDate.new(booking_date_params)

    respond_to do |format|
      if @booking_date.save
        format.html { redirect_to @booking_date, notice: 'Booking date was successfully created.' }
        format.json { render :show, status: :created, location: @booking_date }
      else
        format.html { render :new }
        format.json { render json: @booking_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_dates/1
  # PATCH/PUT /booking_dates/1.json
  def update
    respond_to do |format|
      if @booking_date.update(booking_date_params)
        format.html { redirect_to @booking_date, notice: 'Booking date was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_date }
      else
        format.html { render :edit }
        format.json { render json: @booking_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_dates/1
  # DELETE /booking_dates/1.json
  def destroy
    @booking_date.destroy
    respond_to do |format|
      format.html { redirect_to booking_dates_url, notice: 'Booking date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_date
      @booking_date = BookingDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_date_params
      params.require(:booking_date).permit(:reserved_date, :booking_id)
    end
end
