class User < ActiveRecord::Base
  has_many :user_tasks

  # Create user using the hash that's returned from the Facebook API
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  # Pulls over the current facebook profile avatar
  def small_image
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end

  # Pulls over the current facebook profile normal sized image
  def normal_image
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
  end
end
