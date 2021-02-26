require 'rails_helper'

RSpec.describe "アイデア投稿", type: :system do
  before do
    @category_idea = FactoryBot.build(:category_idea)
  end

  context 'アイデア投稿ができるとき' do 
    it '正しい情報を入力すればアイデア投稿ができてステータスコード201が返ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('アイデアを登録')
      # 投稿ページへ移動する
      visit new_idea_path
      # body,nameを入力する
      fill_in 'カテゴリ名', with: @category_idea.name
      fill_in 'アイデア名', with: @category_idea.body
      # 投稿ボタンを押すと投稿が成功し、ステータスコード201が返ってくることを確認する
      expect{
      find('input[name="commit"]').click
      }.to change { Idea.count }.by(1)
      expect(page).to have_content('201')
    end
  end
  context 'アイデア投稿ができないとき' do
    it '誤った情報ではアイデア投稿ができずにステータスコード422が返ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('アイデアを登録')
      # 投稿ページへ移動する
      visit new_idea_path
      # body,nameを誤った値で入力する
      fill_in 'カテゴリ名', with: ''
      fill_in 'アイデア名', with: ''
      # 投稿ボタンを押すと投稿が失敗し、ステータスコード422が返ってくることを確認する
      expect{
      find('input[name="commit"]').click
      }.to change { Idea.count }.by(0)
      expect(page).to have_content('422')
    end
  end
end
