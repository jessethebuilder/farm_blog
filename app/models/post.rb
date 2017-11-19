class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  validates :title, presence: true
  slug :title

  field :content, type: String

  field :published, type: Mongoid::Boolean, default: false

  field :image, type: String
  mount_uploader :image, FarmBlogImageUploader, dependent: :destroy

  belongs_to :post_category

  attr_accessor :new_post_category

  def status
    published? ? 'Published' : 'Draft'
  end

  def publication_date
    updated_at.strftime('%B, %e %Y')
  end
end
