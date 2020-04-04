# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    # validates :pass
    attr_reader :password
    after_initialize :ensure_session_token

    has_many :goals,
        foreign_key: :author_id,
        class_name: :Goal

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        return nil if @user.nil?
        @user.check_password(password) ? @user : nil
    end

    def password=(given_password)
        @password = given_password
        self.password_digest = BCrypt::Password.create(given_password)
    end

    def check_password(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    private
    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

end
