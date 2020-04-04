# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text
#  author_id  :integer          not null
#  completed  :boolean          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
    validates :title, :author_id, :completed, presence: true
    # validates [:author_id, :title], uniqueness: true

    belongs_to :user,
        foreign_key: :author_id,
        class_name: :User
end
