class Material < ApplicationRecord
  attribute :review_after, default: -> { 10.minutes.from_now }
  attribute :state, default: 'learning'
  enum state: [:learning, :memorizing]
  has_many :reviews
  has_many :recalls
end
