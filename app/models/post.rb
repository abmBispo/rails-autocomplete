# frozen_string_literal: true

class Post < ApplicationRecord
  # Model validations
  validates :title, :body,  presence: true
  validates :title,         length: { maximum: 140 }
  validates :body,          length: { maximum: 1000 }

  searchkick  word_middle: [:title],
              text_middle: [:body],
              language: 'brazilian',
              synonyms: [
                ["coronavirus", "COVID-19"],
                ["corona virus", "COVID-19"],
                ["corona virus", "COVID"],
                ["coronavirus", "COVID"]
              ]
end
