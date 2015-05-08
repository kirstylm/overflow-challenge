class QuestionsController < ApplicationController
  # def index
  #   query_params = Rack::Utils.parse_nested_query request.env["QUERY_STRING"]
  #   @questions = Question.where(query_params)
  # end

  def index

    if params[:user_id]
      @questions = User.find(params[:user_id]).questions.paginate(:page => params[:page], :per_page => 5)
    else
      @questions = Question.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
    @question = Question.find(params[:id])
    add_breadcrumb "question #{@question.id}", questions_path
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(user_id: current_user.id, title: params[:question][:title], description: params[:question][:description])
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  # def update
  #   @question = Question.find params[:id]
  #   if @question.update_attributes params[:title]
  #     redirect_to question_path(@question)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   question = Question.find params[:id]
  #   question.destroy
  #   redirect_to root_path
  # end

end
