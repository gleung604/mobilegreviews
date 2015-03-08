class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_tags, :dependent => :destroy
  has_many :tags, through: :article_tags
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  validate :picture_size

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.downcase.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def date
    self.updated_at.to_date.strftime("%B %d, %Y")
  end

  def self.search(search)
    search_condition = "%#{search.downcase}%"
    where("lower(title) LIKE ? OR lower(body) LIKE ?", search_condition, search_condition)
  end

  private

    # Validates the size of an uploaded picture
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
