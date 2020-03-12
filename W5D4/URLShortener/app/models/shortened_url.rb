# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  user_id   :integer          not null
#  long_url  :string           not null
#  short_url :string           not null
#
class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true 

  def self.random_code
    
    url = SecureRandom::urlsafe_base64 
    while self.exists?(url)
      url = SecureRandom::urlsafe_base64 
    end
    :short_url => url
  end
  
end
