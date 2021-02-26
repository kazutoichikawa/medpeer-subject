require 'rails_helper'

RSpec.describe 'アイデア投稿', type: :system do
  before do
    @category_idea = FactoryBot.build(:category_idea)
  end

  context 'アイデア投稿ができるとき' do
    it '正しい情報を入力すればアイデア投稿ができてステータスコード201が返ってくる' do
      visit root_path
      expect(page).to have_content('アイデアを登録')
      visit new_idea_path
      fill_in 'カテゴリ名', with: @category_idea.name
      fill_in 'アイデア名', with: @category_idea.body
      expect  do
        find('input[name="commit"]').click
      end.to change { Idea.count }.by(1)
      expect(page).to have_content('201')
    end
  end
  context 'アイデア投稿ができないとき' do
    it '誤った情報ではアイデア投稿ができずにステータスコード422が返ってくる' do
      visit root_path
      expect(page).to have_content('アイデアを登録')
      visit new_idea_path
      fill_in 'カテゴリ名', with: ''
      fill_in 'アイデア名', with: ''
      expect  do
        find('input[name="commit"]').click
      end.to change { Idea.count }.by(0)
      expect(page).to have_content('422')
    end
  end
end
