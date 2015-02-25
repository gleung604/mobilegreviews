class Tag < ActiveRecord::Base
  before_save :downcase_name
  has_many :article_tags, :dependent => :destroy
  has_many :articles, through: :article_tags
  validates :name, presence: true, 
                   uniqueness: { case_sensitive: false }

  def downcase_name
    self.name = name.downcase
  end
end
