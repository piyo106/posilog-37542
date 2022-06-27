require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "OODA記録機能", type: :system do
  before do
   @goal = FactoryBot.create(:goal)
   @log_content = Faker::Lorem.sentence
  end

  context 'OODA記録に失敗した時' do
    it '送る値が空の為、OODA記録の送信に失敗する' do
      # トップページに移動する
      basic_pass root_path
      visit root_path
      # 設定された目標のOODA記録ページに遷移する
      click_on(@goal.title)
      # 目標と目的が表示されていることを確認する
      expect(page).to have_content @goal.title
      expect(page).to have_content @goal.purpose
      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change { Log.count }
      # エラーメッセージが表示されていることを確認する
      expect(page).to have_content('内容を入力してください')
      expect(page).to have_content('OODAを選択してください')
    end
  end
  context 'OODA記録に成功した時' do
    it 'OODA記録に成功すると、記録した内容が表示されている' do
      # トップページに移動する
      visit root_path
      # 設定された目標のOODA記録ページに移動する
      click_on(@goal.title)
      # 値をテキストフォームに入力する
      select 'Act', from: 'log_category_id'
      fill_in 'log_content', with: @log_content
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Log.count }.by(1)
      # OODAページに留まっていることを確認する
      expect(current_path).to eq goal_logs_path(@goal)
      # 投稿した値がブラウザに表示されていることを確認する
      expect(page).to have_content 'Act'
      expect(page).to have_content @log_content
    end
  end
end
