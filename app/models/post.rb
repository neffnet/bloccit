class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }

  validates :title, length: {minimum:5},presence: true
  validates :body, length: {minimum:20},presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks:true,hard_wrap:true}
    redcarpet = Redcarpet::Markdown.new(renderer,extensions)
    (redcarpet.render markdown).html_safe
  end

  def markdown_title
    render_as_markdown self.title
  end

  def markdown_body
    render_as_markdown self.body
  end

  private

    def render_as_markdown(stuff)
      markdown_to_html(stuff)
    end
  
end
