class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  after_initialize :init

  enum role: [:standard, :premium, :admin]

  def init
    self.role ||= 'standard'
  end

  def self.upgrade(user)
    user.premium! ? true : false
  end

  def self.downgrade(user)
    user.standard! ? true : false
  end

end
