class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_date ,presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  has_one :address
  has_many :items, foreign_key: 'seller_id'
end
