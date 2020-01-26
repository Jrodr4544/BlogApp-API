class Post < ApplicationRecord
    has_many :comments

    validates :title, :author, :body, presence: true
end
