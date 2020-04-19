# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_at, :updated_at

  def published_at
    I18n.l(object.created_at, format: :descriptive_datetime)
  end

  def updated_at
    I18n.l(object.updated_at, format: :descriptive_datetime)
  end
end
