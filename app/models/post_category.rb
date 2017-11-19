class PostCategory
  include Mongoid::Document

  field :name, type: String
  validates :name, presence: true, uniqueness: true

  has_many :posts

end
