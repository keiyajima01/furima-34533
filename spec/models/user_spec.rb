require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録ができる場合' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayがあれば、登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上半角英数字混合であれば登録できること' do
        @user.password = 'aaa123'
        @user.password_confirmation = 'aaa123'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'ニックネームが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに＠がない場合は登録できない' do
        @user.email = 'aaaemail'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが半角英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字両方を入力してください")
      end
      it 'passwordが半角数字のみであれば登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字両方を入力してください")
      end
      it 'password：5文字以下は登録できない' do
        @user.password = 'aaa45'
        @user.password_confirmation = 'aaa45'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it '全角英数混合（6桁）は登録できない' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字両方を入力してください")
      end
      it 'password_confirmation：passwordとpassword_confirmationが一致しない場合、登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を全角で入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を全角で入力してください")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名を全角で入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を全角カタカナで入力してください")
      end
      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = '全角'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を全角カタカナで入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '全角'
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を全角カタカナで入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end