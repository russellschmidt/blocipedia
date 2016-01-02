class Collaboration < ActiveRecord::Base
  has_one :collaborator, class_name: "User"
  has_one :wiki
end
