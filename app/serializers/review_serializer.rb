class ReviewSerializer < ActiveModel::Serializer
  attributes :content, :id
  belongs_to :book
end
