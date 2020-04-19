# frozen_string_literal: true

class Post < ApplicationRecord
  # Model validations
  validates :title, :body,  presence: true
  validates :title,         length: { maximum: 45 }
  validates :body,          length: { maximum: 140 }

  searchkick word_start: [:title, :body]
end
