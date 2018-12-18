class User < ApplicationRecord
  has_many :articles
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pseudo, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
