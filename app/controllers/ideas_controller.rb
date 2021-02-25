class IdeasController < ApplicationController
  def index
    idea = Idea.all
  end

  def new
    @category_idea = CategoryIdea.new
  end

  def create
    # binding.pry
    @category_idea = CategoryIdea.new(category_idea_params)
    if @category_idea.valid?
      @category_idea.save
      redirect_to action: :index
    else
      render action: :new
    end
    # f = (params[:name])
    # if Category.where(name: "#{f}").count >= 1
    #   idea = Idea.create
    #   render status: 201, json: { status: 201, message: 'Created' }
    # else
    #   idea = Category.create(category_params)
    #   Idea.create(idea_params(idea))
    #   #status_code201を返す処理
    #   render status: 201, json: { status: 201, message: 'Created' }
    #   #status_code422を返す処理
    #   # render status: 422, json: { status: 422, message: 'Unprocessable Entity' }
    # end
  end

  def search
  end
end

private
  def category_idea_params
    params.require(:category_idea).permit(:name, :body)
  end

  