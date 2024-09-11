require 'rails_helper'

RSpec.describe Partner, type: :model do
  before do
    @partner = FactoryBot.build(:partner)
  end

  describe '紹介元新規登録' do
    context '新規登録できるとき' do
      it '医療機関名、医療機関分類が存在し登録可能' do
        expect(@partner).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '医療機関名が空では登録できない' do
        @partner.institution_name = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Institution name can't be blank")
      end
      it '医療機関分類が空では登録できない' do
        @partner.institution_category_id = ""
        @partner.valid?
        expect(@partner.errors.full_messages).to include("Institution category can't be blank")
      end
    end
  end
end
