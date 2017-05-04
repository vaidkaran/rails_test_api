class Post < ApplicationRecord
  validates_presence_of :title, :body
  validates_associated :user

  belongs_to :user
end
