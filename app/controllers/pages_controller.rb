class PagesController < ApplicationController
  def home
    @user = User.new
    @user = current_user if user_signed_in?
    @event = Event.new
    @events = Event.all
    @hangout = Hangout.new
  end
end
