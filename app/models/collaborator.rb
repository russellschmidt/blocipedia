class Collaborator < ActiveRecord::Base
  has_one :user
  has_one :wiki
end
