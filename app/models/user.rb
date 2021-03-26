class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :oders
  has_many :comments

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: "を全角で入力してください" } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "を全角カタカナで入力してください" } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字両方を入力してください" }
    validates :birthday
  end
end
