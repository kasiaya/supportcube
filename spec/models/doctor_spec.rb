require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before do
    @doctor = FactoryBot.build(:doctor)
  end

  describe '担当医新規登録' do
    context '新規登録できるとき' do
      it '担当医名、診療科が存在し登録可能' do
        expect(@doctor).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '医療機関名が空では登録できない' do
        @doctor.doctor_name = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Doctor name can't be blank")
      end
      it '医療機関分類が空では登録できない' do
        @doctor.specialty_id = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Specialty can't be blank")
      end
    end
  end
end
