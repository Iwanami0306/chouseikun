# coding: utf-8
class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def show
    @event = Event.find_by(id: params[:id])
    @event_dates = @event.event_dates
    @answer = []
    @event_dates.each do |event_date|
      @answer.push(event_date.answers.build)
    end
    @join = Join.new
    @joins = Join.where(event_id: params[:id])
    @answers = Answer.where("join_id = #{@joins.ids} and event_date_id = #{@event.event_dates.ids}")
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_update_params)
      update_event_dates
      flash[:success] = "イベント内容を変更しました"
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name,:memo,:time)
  end

  def event_update_params
    params.require(:event).permit(:name,:memo)
  end
  
  def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
  end

  def update_event_dates
    @event.event_dates.each do |event_date|
      if params[:event]["#{event_date.choice}"][:delete]=='1'
        event_date.destroy
      end
    end
    time = params[:event][:new_choices][:time]
    if !time.empty?
      time.each_line do |line|
      EventDate.create(choice: line.strip, event_id: @event.id)
    end
    
    end
  end
end
