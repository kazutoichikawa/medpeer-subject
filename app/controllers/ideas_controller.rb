class IdeasController < ApplicationController
  def index
    @idea = Idea.all
  end

  def create
  end

  def search
  end
end
