class Author < ApplicationRecord
  has_many :posts
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
