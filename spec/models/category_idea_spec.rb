require 'rails_helper'

RSpec.describe CategoryIdea, type: :model do
  describe 'アイデアの保存' do
    before do
      @category_idea = FactoryBot.build(:category_idea)
    end

    it 'name,bodyが正しく入力されていれば保存できること' do
      expect(@category_idea).to be_valid
    end

    it 'nameが空だと保存できないこと' do
      @category_idea.name = ''
      @category_idea.valid?
      expect(@category_idea.errors.full_messages).to include("Name can't be blank")
    end
    it 'bodyが空だと保存できないこと' do
      @category_idea.body = ''
      @category_idea.valid?
      expect(@category_idea.errors.full_messages).to include("Body can't be blank")
    end
  end
end
