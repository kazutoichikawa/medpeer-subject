class CategoryIdea
  include ActiveModel::Model
  attr_accessor :name, :body

  with_options presence: true do
    validates :name
    validates :body
  end

  def save
     @f = name
    if Category.where(name: "#{@f}").count >= 1 #既存
      array = Category.where(name: "#{@f}")
      target_record = array[0]
      target_record.id
      Idea.create(body: body, category_id: target_record.id)
      
    else #新規
    category = Category.create(name: name)
    Idea.create(body: body, category_id: category.id)
    end
  end
end
