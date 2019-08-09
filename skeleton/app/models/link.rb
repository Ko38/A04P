class Link < ApplicationRecord
  validates(:user_id, :title, :url, presence: true)

  has_many(:comments,
    foreign_key: :link_id,
    primary_key: :id,
    class_name: :Comment)

  belongs_to(:user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User)
end
