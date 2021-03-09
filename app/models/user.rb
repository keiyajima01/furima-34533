class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: "is invalid. Input full-width katakana characters." } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both half-width letters and numbers" }
    validates :birthday
  end
end
