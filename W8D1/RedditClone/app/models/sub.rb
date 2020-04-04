class Sub < ApplicationRecord
    validates :title, :description, presence: true
    validates :title, uniqueness: true
    
    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post

    belongs_to :moderator,
        class_name: :User,
        foreign_key: :mod_id
end
