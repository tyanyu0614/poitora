require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe '#create' do
    before do
      @plan = FactoryBot.build(:plan)
    end

    it 'タイトルがない場合は登録できない' do
      @plan.title = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Title can't be blank")
    end

    it '記事内容がない場合は登録できない' do
      @plan.content = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Content can't be blank")
    end

    it '総費用がない場合は登録できない' do
      @plan.cost = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Cost can't be blank")
    end

    it '画像がない場合は登録できない' do
      @plan.image = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Image can't be blank")
    end

    it '総費用が半角数字でない場合は登録できない' do
      @plan.cost = '０'
      @plan.valid?
      expect(@plan.errors.full_messages).to include('Cost is invalid')
    end
  end
end
