class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborations

  after_initialize :init

  enum role: [:standard, :premium, :admin]

  def init
    self.role ||= 'standard'
  end

  def upgrade
    self.premium! ? true : false
  end

  def downgrade
    self.standard! ? true : false
  end


end
