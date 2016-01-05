class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations

  def make_public
    self.private = false
    self.save
  end

  def add_collab(collaborator_id)
    collab = Collaboration.new(collaborator_id: collaborator_id, wiki: self)
    collab.save
  end

  def remove_collab(collaborator_id)
    collab = Collaboration.where(collaborator_id: collaborator_id, wiki: self)
    Collaboration.destroy(collab[0].id)
  end
end
