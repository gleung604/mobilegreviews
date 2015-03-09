class Review < Article
  validates :score, presence: true, :inclusion => 0..10
end
