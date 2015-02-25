class ArticleTag < ActiveRecord::Base
  before_destroy :find_tag
  after_destroy :destroy_unused_tag
  belongs_to :article
  belongs_to :tag

  def find_tag
    @tag_id = self.tag.id
  end

  def destroy_unused_tag
    @tag = Tag.find(@tag_id)
    @tag.destroy
  end
end
