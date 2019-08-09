class Comment < ApplicationRecord
  validates(:body, :user_id, :link_id, presence: true)

  belongs_to(:user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User)

  belongs_to(:link,
    foreign_key: :link_id,
    primary_key: :id,
    class_name: :Link)
end
