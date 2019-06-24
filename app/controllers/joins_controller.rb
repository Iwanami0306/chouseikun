# coding: utf-8
class JoinsController < ApplicationController
  before_action :name_blank_check,  only: :create
   
  def create
    @join = Join.new(join_params)
    @join.event_id = params[:event_id]
 
    if @join.save
      answer_save     
      flash[:success] = "出席を入力しました"
      redirect_to request.referer || roote_url
    else
      redirect_to request.referer
    end
  end

  def edit
    @join = Join.find_by(id: params[:id])
  end

  def update
    @join = Join.find_by(id: params[:id])
    if @join.update_attributes(params.require(:join).permit(:name))
      update_answer
      flash[:success] = "出席を編集しました"
      redirect_to event_path(@join.event)
    else
      render 'edit'
    end
  end
  private

    def join_params
      params.require(:join).permit(:name)
    end

    def name_blank_check
     if params[:join][:name].blank?
      params[:join][:name]="名無し"
     end
    end
    
    def answer_save
      @event_dates = EventDate.where(event_id: @join.event_id)
      @event_dates.each do |event_date|
        answer= @join.answers.build(event_date_id: event_date.id,
                          join_id: @join.id,
                          feeling: params[:join]["#{event_date.choice}"][:feeling])
        answer.save
      end
    end

    def update_answer
      @event_dates = EventDate.where(event_id: @join.event_id)
      @event_dates.each do |event_date|
        ans = Answer.find_by(event_date_id: event_date.id, join_id: @join.id)
        if ans
          ans.update_attributes(feeling: params[:join]["#{event_date.choice}"][:feeling])
        else
          answer= @join.answers.build(event_date_id: event_date.id,
                          join_id: @join.id,
                          feeling: params[:join]["#{event_date.choice}"][:feeling])
          answer.save
        end
      end
    end
end
