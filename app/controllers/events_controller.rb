# coding: utf-8
class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def show
    @event = Event.find_by(id: params[:id])
    @choices = @event.time.split(/\R/)
  end
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "イベントが作成されました"
      redirect_to @event
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "イベントが削除されました"
    redirect_to request.referer || root_url
  end

  private
  
  def event_params
    params.require(:event).permit(:name,:memo,:time)
  end

  def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
  end

end
