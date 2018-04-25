class ReviewSerializer < ActiveModel::Serializer
  attributes :content, :id
  belongs_to :book
  belongs_to :user
end
