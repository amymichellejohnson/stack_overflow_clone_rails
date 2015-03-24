class VotesController < ApplicationController

  def create
    Vote.create({:user_id => current_user.id, :answer_id => params[:answer_id]})
    flash[:notice] = "Vote successfully submitted"
    redirect_to questions_path
  end
end
