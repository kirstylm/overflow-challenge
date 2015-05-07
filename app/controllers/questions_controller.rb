class QuestionsController < ActionController::Base
  # def index
  #   query_params = Rack::Utils.parse_nested_query request.env["QUERY_STRING"]
  #   @questions = Question.where(query_params)
  # end
  def index
    if params[:user_id]
      @questions = User.find(params[:user_id]).questions
    else
      @questions = Question.all
    end
  end

  def show
    @question = Question.find(params[:id])
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
