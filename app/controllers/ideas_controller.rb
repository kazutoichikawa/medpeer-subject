class IdeasController < ApplicationController
  def index
    @idea = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    if @idea.valid?
      @idea.save
      #status_code201を返す処理
      redirect_to action: :index
    else
      #status_code422を返す処理
      render action: :new
    end
  end

  def search
  end
end

private

  def idea_params
    params.require(:idea).permit(:body)
  end
