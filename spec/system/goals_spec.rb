require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "目標設定機能", type: :system do
  before do
    @goal_title = Faker::Lorem.sentence
    @goal_purpose = Faker::Lorem.sentence
  end
  context '目標設定に失敗したとき' do
    it '送る値が空の為。目標設定の送信に失敗する' do
      # トップページに移動する
      basic_pass root_path
      visit root_path
      # トップページに「目標を宣言する」ボタンがあることを確認する
      expect(page).to have_content('目標を宣言する')
      # 目標設定ページに遷移する
      visit new_goal_path
      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change { Goal.count }
      # エラーメッセージが表示されていることを確認する
      expect(page).to have_content('目標を入力してください')
      expect(page).to have_content('目的を入力してください')
      expect(page).to have_content('タグを選択してください')
    end
  end

  context '目標設定に成功したとき' do
    it '目標の設定に成功すると、目標一覧画面（トップページ）に遷移して、設定した内容が表示されている' do
      # 目標設定ページに遷移する
      visit new_goal_path
      # 値をテキストフォームに入力する
      fill_in 'goal_title', with: @goal_title
      fill_in 'goal_purpose', with: @goal_purpose
      select 'Private', from: 'goal_tag_id'
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Goal.count }.by(1)
      # 目標一覧画面に遷移していることを確認する
      expect(current_path).to eq(root_path)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content @goal_title
      expect(page).to have_selector '.goal-tag-text'
    end
  end


end
