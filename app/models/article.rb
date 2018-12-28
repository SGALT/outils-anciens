class Article < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :profession, presence: true
  validates :content, presence: true
  mount_uploader :photo, PhotoUploader
end
