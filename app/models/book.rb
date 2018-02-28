class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  has_many :list_books
  has_many :lists, through: :list_books

  validates :title, presence: true
  validates :title, uniqueness: {scope: :author_id}

  def genre_name=(name)
    self.genre = Genre.find_by(name:name)
  end

  def genre_name
    self.genre.name
  end
end
