class Tag < ActiveRecord::Base
  before_save :downcase_name
  has_many :article_tags, :dependent => :destroy
  has_many :articles, through: :article_tags
  VALID_TAG_REGEX = /\A[a-zA-Z]*\z/
  validates :name, presence: true, 
                   uniqueness: { case_sensitive: false },
                   format: { with: VALID_TAG_REGEX }

  def to_param
    name
  end

  def downcase_name
    self.name = name.downcase
  end
end
