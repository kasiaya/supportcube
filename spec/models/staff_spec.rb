require 'rails_helper'

RSpec.describe Staff, type: :model do
  before do
    @staff = FactoryBot.build(:staff)
  end

  describe 'スタッフ新規登録' do
    context '新規登録できるとき' do
      it '職員ID、部署、スタッフ名、スタッフ名フリガナ、メールアドレス、パスワードとpassword_confirmationが存在し登録可能' do
        expect(@staff).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '職員IDが空では登録できない' do
        @staff.employee_id = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Employee can't be blank")
      end
      it '重複した職員IDがある場合は登録できない' do
        @staff.save
        another_staff = FactoryBot.build(:staff)
        another_staff.employee_id = @staff.employee_id
        another_staff.valid?
        expect(another_staff.errors.full_messages).to include('Employee has already been taken')
      end
      it '部署が空では登録できない' do
        @staff.department = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Department can't be blank")
      end
      it 'スタッフ名が空では登録できない' do
        @staff.staff_name = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Staff name can't be blank")
      end
      it 'スタッフ名のフリガナが空では登録できない' do
        @staff.staff_name_kana = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Staff name kana can't be blank")
      end
      it 'スタッフ名のフリガナにカタカナ以外の文字が含まれていると登録できない' do
        @staff.staff_name_kana = 'やまだ'
        @staff.valid?
        expect(@staff.errors.full_messages).to include('Staff name kana is invalid. Input full-width katakana character')
      end
      it 'メールアドレスが空では登録できない' do
        @staff.email = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスが存在する場合は登録できない' do
        @staff.save
        another_staff = FactoryBot.build(:staff)
        another_staff.email = @staff.email
        another_staff.valid?
        expect(another_staff.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @staff.email = 'testmail'
        @staff.valid?
        expect(@staff.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @staff.password = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @staff.password = '123456'
        @staff.password_confirmation = '1234567'
        @staff.valid?
        expect(@staff.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @staff.password = '00000'
        @staff.password_confirmation = '00000'
        @staff.valid?
        expect(@staff.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @staff.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @staff.password_confirmation = @staff.password
        @staff.valid?
        expect(@staff.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it '全角文字を含むpasswordでは登録できない' do
        @staff.password = 'パスワード123'
        @staff.password_confirmation = 'パスワード123'
        @staff.valid?
        expect(@staff.errors.full_messages).to include('Password must contain both letters and numbers')
      end
    end
  end
end
