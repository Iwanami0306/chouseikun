# coding: utf-8
class JoinsController < ApplicationController
  def create
    if params[:join][:name].blank?
      params[:join][:name]="名無し"
    end
    @join = Join.new(join_params)
    @join.event_id = params[:event_id]
    if @join.save
      flash[:success] = "出席を入力しました"
      redirect_to request.referer || root_url
    else
      redirect_to request.referer
    end
  end

  private

    def join_params
      params.require(:join).permit(:name)
    end
  
end
