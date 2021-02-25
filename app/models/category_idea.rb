class CategoryIdea
  include ActiveModel::Model
  attr_accessor :name, :body

  def save
    idea = Category.create(name: name)
    Idea.create(body: body)
  end

end
