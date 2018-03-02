class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  has_many :list_books
  has_many :reading_lists, through: :list_books

  validates :title, :publication_year, :blurb, presence: true
  validates :title, uniqueness: {scope: :author_id}
  validates :publication_year, numericality: true

  def list_count
    self.reading_lists.count
  end

end
