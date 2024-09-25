require 'rails_helper'

RSpec.describe Referral, type: :model do
  before do
    @referral = FactoryBot.build(:referral)
  end

  describe '紹介元新規登録' do
    context '新規登録できるとき' do
      it '患者名、性別、入院歴、目的、介護保険、調整状況、判定結果、紹介元、担当医、スタッフIDがある場合、登録可能' do
        expect(@referral).to be_valid
      end
      it 'ADLが空でも登録できる' do
        @referral.adl = ''
        @referral.valid?
      end
      it '転帰予定が空でも登録できる' do
        @referral.prognosis = ''
        @referral.valid?
      end
      it '追記事項が空でも登録できる' do
        @referral.memo = ''
        @referral.valid?
      end
    end
    context '新規登録できないとき' do
      it '患者名が空では登録できない' do
        @referral.patient_name = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("Patient name can't be blank")
      end
      it '年齢が負の値では登録できない' do
        @referral.age = -1
        @referral.valid?
        expect(@referral.errors.full_messages).to include('Age must be greater than or equal to 0')
      end

      it '年齢が130を超える値では登録できない' do
        @referral.age = 131
        @referral.valid?
        expect(@referral.errors.full_messages).to include('Age must be less than or equal to 130')
      end
      it '性別が空では登録できない' do
        @referral.gender = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("Gender can't be blank")
      end
      it '入院歴が空では登録できない' do
        @referral.history = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("History can't be blank")
      end
      it '目的が空では登録できない' do
        @referral.purpose = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("Purpose can't be blank")
      end
      it '介護保険が空では登録できない' do
        @referral.insurance = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("Insurance can't be blank")
      end
      it '調整状況が空では登録できない' do
        @referral.status = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("Status can't be blank")
      end
      it '判定結果が空では登録できない' do
        @referral.determination = ''
        @referral.valid?
        expect(@referral.errors.full_messages).to include("Determination can't be blank")
      end
      it '紹介元が空では登録できない' do
        @referral.partner = nil
        @referral.valid?
        expect(@referral.errors.full_messages).to include('Partner must exist')
      end
      it '担当医が空では登録できない' do
        @referral.doctor = nil
        @referral.valid?
        expect(@referral.errors.full_messages).to include('Doctor must exist')
      end
      it 'スタッフIDが存在しない場合は登録できない' do
        @referral.staff = nil
        @referral.valid?
        expect(@referral.errors.full_messages).to include('Staff must exist')
      end
    end
  end
end
