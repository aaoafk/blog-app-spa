# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true

  scope :created_at_desc, -> { order(created_at: :desc) }
end
