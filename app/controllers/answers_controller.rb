class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def show
    @answer= Answer.find params[:id]
  end

  def new
    @question = Question.find params[:question_id]
    @answer= Answer.new
  end

  def create
    question = Question.find params[:question_id]
    @answer= question.answers.build params[:answer]
    if @answer.save
      redirect_to question_answer_path(question, @answer)
    else
      render :new
    end
  end

  def edit
    @questions = Question.all.map {|question| [question.name, question.id]}
    @answer= Answer.find params[:id]
  end

  def update
    @answer= Answer.find params[:id]
    if @answer.update_attributes params[:answer]
      redirect_to question_answer_path(@answer.question, @answer)
    else
      render :edit
    end
  end

  def destroy
    answer = Answer.find params[:id]
    answer.destroy
    redirect_to root_path
  end
end
