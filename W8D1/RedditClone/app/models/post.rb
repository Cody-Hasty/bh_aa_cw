class Post < ApplicationRecord
    validates :title, presence: true
    # validates :url, :content

    belongs_to :sub,
        class_name: :Sub,
        foreign_key: :sub_id

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id
end
