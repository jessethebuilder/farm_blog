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

  field :keywords, type: String

  field :summary, type: String

  belongs_to :post_category, optional: true

  attr_accessor :new_post_category

  def status
    published? ? 'Published' : 'Draft'
  end

  def publication_date
    updated_at.in_time_zone("America/Los_Angeles").strftime('%B, %e %Y')
  end

  def publication_time
    time = updated_at.in_time_zone("America/Los_Angeles").strftime('%l:%M %P %Z')
    "#{publication_date} #{time}"
  end

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def first_paragraph
    /<p>(.*?)<\/p>/ =~ content
    $1
  end

  # before_save :update_summary

  private

  # def update_summary
  #   if summary.blank? || summary != first_paragraph
  #     self.summary = first_paragraph
  #   end
  # end
end
