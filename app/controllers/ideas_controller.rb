class IdeasController < ApplicationController
  def index
    category = params[:name]
    if category.present?
      target_category = Category.where(name: category).first
      if target_category.nil?
        not_found_status_code
      else
        @results = Idea.where(category_id: target_category.id)
      end
    else
      @results = Idea.all
    end
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

  def not_found_status_code
    render text: 'error', status: 404
  end
end
