# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :tags, as: :taggable, dependent: :destroy

  scope :created_at_desc, -> { order(created_at: :desc) }
end
