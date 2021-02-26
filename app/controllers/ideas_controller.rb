class IdeasController < ApplicationController
  before_action :search_idea, only: [:index, :search]
  before_action :set_category, only: [:index, :search]
  def index
    @ideas = Idea.all
  end

  def search
    @results = @p.result.includes(:category)
  end

  def new
    @category_idea = CategoryIdea.new
  end

  def create
    @category_idea = CategoryIdea.new(category_idea_params)
    if @category_idea.valid?
      @category_idea.save
      sucssess_status_code
    else
      failed_status_code
    end
  end

  private

  def category_idea_params
    params.require(:category_idea).permit(:name, :body)
  end

  def sucssess_status_code
    redirect_to root_path, status: :created
  end

  def failed_status_code
    render :new, status: 422
  end

  def search_idea
    @p = Idea.ransack(params[:q])
  end

  def set_category
    @categorys = Category.all
  end
end
