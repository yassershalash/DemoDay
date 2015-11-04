class HangoutsController < ApplicationController
  before_action :set_hangout, only: [:show, :edit, :update, :destroy]

  # GET /hangouts
  # GET /hangouts.json
  def index
    @hangouts = Hangout.all
  end

  # GET /hangouts/1
  # GET /hangouts/1.json
  def show
  end

  # GET /hangouts/new
  def new
    @hangout = Hangout.new
  end

  # GET /hangouts/1/edit
  def edit
  end

  # POST /hangouts
  # POST /hangouts.json
  def create
    @event = Event.find(params[:hangout][:event])
    @user = User.find(params[:hangout][:user])
    @hangout = Hangout.new(user: @user, event: @event)

    respond_to do |format|
      if params[:hangout][:user] == @event.user_id && !Hangout.where(event: @event, user: @user).first.nil?
        format.html { redirect_to root_path, notice: 'You\'re already joined' }
      elsif @event.joined == @event.needed
        format.html { redirect_to root_path, notice: 'Event is full' }
      elsif @hangout.save
        @hangout.event.joined = @hangout.event.joined + 1
        @hangout.event.save
        format.html { redirect_to root_path, notice: 'Event Joined!' }
        format.json { render :show, status: :created, location: @hangout }
      else
        format.html { render :new }
        format.json { render json: @hangout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hangouts/1
  # PATCH/PUT /hangouts/1.json
  def update
    respond_to do |format|
      if @hangout.update(hangout_params)
        format.html { redirect_to @hangout, notice: 'Hangout was successfully updated.' }
        format.json { render :show, status: :ok, location: @hangout }
      else
        format.html { render :edit }
        format.json { render json: @hangout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hangouts/1
  # DELETE /hangouts/1.json
  def destroy
    @hangout.destroy
    respond_to do |format|
      format.html { redirect_to hangouts_url, notice: 'Hangout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hangout
      @hangout = Hangout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hangout_params
      params.require(:hangout).permit(:user, :event)
    end
end
