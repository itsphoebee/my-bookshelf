class Genre < ApplicationRecord
  has_many :books

  validates :name, :description, presence:true
  validates :name, uniqueness: true

end
