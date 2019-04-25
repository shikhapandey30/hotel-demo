class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :edit, :update, :destroy]
   before_action :set_booking, only: [:show, :edit, :update, :destroy, :available_rooms, :search_rooms]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    # @booking = Booking.new

    if current_user.present?
      @booking = Booking.new
      @hotel = Hotel.find(params[:id])
      @room = Room.find(params[:id])
    else
      flash[:notice] = "Please Login Before Booking"
      redirect_to "/users/sign_in"
    end 
  end

  def search_rooms
  end
  def available_rooms
    @booking = current_user.bookings.new(booking_params)
    @hotel_rooms = @bookings.rooms.available_rooms(params[:booking][:check_in], params[:booking][:check_out])
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = current_user.bookings.new(booking_params)
    @booking.hotel_id = params[:hotel_id].to_i
    # respond_to do |format|
       # @booking.save!
        # format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
      #   # format.json { render :show, status: :created, location: @booking }
      # else
      #   format.html { render :new }
      #   format.json { render json: @booking.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @bookings = Hotel.find(params[:hotel_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:check_in, :check_out, :hotel_id, :room_id, :user_id)
    end
end
