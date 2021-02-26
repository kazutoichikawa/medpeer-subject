require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'アイデアの保存' do
    before do
      @category = FactoryBot.build(:category)
    end

    it 'nameが正しく入力されていれば保存できること' do
      expect(@category).to be_valid
    end

    it 'nameに一意性がないと保存できないこと' do
      @category.save
      another_category = FactoryBot.build(:category)
      another_category.valid?
      expect(another_category.errors.full_messages).to include('Name has already been taken')
    end
  end
end
