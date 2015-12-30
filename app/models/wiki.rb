class Wiki < ActiveRecord::Base
  belongs_to :user

  def self.unprivate(user)
    Wiki.where(user_id: user.id, private: true).each do |wiki|
      wiki.private = false
      wiki.save
    end
  end
end
