class QuestionsController < ApplicationController

  def index
    
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Your question has successfully been submitted."
      redirect_to questions_path
    else
      flash[:alert] = "Your question failed to submit."
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
