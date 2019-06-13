# coding: utf-8
class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "イベントが作成されました"
      redirect_to @event
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @event = Event.find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:name,:memo)
    end
end
