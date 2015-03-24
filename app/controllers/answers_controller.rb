class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice] = "Your answer has successfully been submitted."
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.question.answers.each do |ans|
      ans.update(:is_first => false)
    end
    if @answer.update(:is_first => true)
      flash[:notice] = "You have successfully chosen an answer as your favorite"
    end
    redirect_to questions_path
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

end
