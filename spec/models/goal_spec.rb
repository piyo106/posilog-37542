require 'rails_helper'

RSpec.describe Goal, type: :model do
  before do
    @goal = FactoryBot.build(:goal)
  end

  describe '目標設定登録' do
    context '目標設定できる場合' do
      it '目標、目的、タグが存在すれば保存できる' do
        expect(@goal).to be_valid
      end
    end

    context '目標設定できない場合' do
      it '目標が空では保存できない' do
        @goal.title = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include "目標を入力してください"
      end
      it '目的が空では保存できない' do
        @goal.purpose = ''
        @goal.valid?
        expect(@goal.errors.full_messages).to include "目的を入力してください"
      end
      it 'タグが初期値だと保存できない' do
        @goal.tag_id = 1
        @goal.valid?
        expect(@goal.errors.full_messages).to include "タグを選択してください"
      end
    end
  end
end
