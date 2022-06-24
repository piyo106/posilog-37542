require 'rails_helper'

RSpec.describe Log, type: :model do
  before do
    @log = FactoryBot.build(:log)
  end

  describe 'OODA記録' do
    context 'OODA記録が保存できる場合' do
      it 'OODA選択し、内容が存在していれば保存できる' do
        expect(@log).to be_valid
      end
    end

    context 'OODA記録が保存できない場合' do
      it 'OODAが初期値だと保存できない' do
        @log.category_id = 1
        @log.valid?
        expect(@log.errors.full_messages).to include "OODAを選択してください"
      end
      it '内容が空だと保存できない' do
        @log.content = ''
        @log.valid?
        expect(@log.errors.full_messages).to include "内容を入力してください"
      end
      it 'goalが紐づいていないと保存できない' do
        @log.goal = nil
        @log.valid?
        expect(@log.errors.full_messages).to include "Goalを入力してください"
      end
    end
  end
end
