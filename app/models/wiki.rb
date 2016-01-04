class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations

  def make_public
    self.private = false
    self.save
  end

  def self.markdowner(input)
    renderer = Redcarpet::Render::HTML.new(safe_links_only: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, autolink: true, underline: true, highlight: true)
    markdown.render(input)
  end

  def add_collab(collaborator_id)
    collaboration = Collaboration.new(collaborator_id: collaborator_id, wiki: self)
    collaboration.save
  end

  def remove_collab(collaborator_id)
    collaboration = Collaboration.where(collaborator_id: collaborator_id, wiki: self)
    Collaboration.destroy(collaboration[0].id)
  end
end
