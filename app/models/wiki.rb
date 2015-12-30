class Wiki < ActiveRecord::Base
  belongs_to :user

  def self.unprivate(user)
    Wiki.where(user_id: user.id, private: true).each do |wiki|
      wiki.private = false
      wiki.save
    end
  end

  def self.markdowner(input)
    renderer = Redcarpet::Render::HTML.new(safe_links_only: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, autolink: true, underline: true, highlight: true)
    markdown.render(input)
  end
end
