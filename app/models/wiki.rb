class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators

  def make_public
    self.private = false
    self.save
  end

  def self.markdowner(input)
    renderer = Redcarpet::Render::HTML.new(safe_links_only: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, autolink: true, underline: true, highlight: true)
    markdown.render(input)
  end
end
