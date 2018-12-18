class Article < ApplicationRecord
  belongs_to :users
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :profession, presence: true
  validates :content, presence: true
end
