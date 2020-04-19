# frozen_string_literal: true

100.times do
  post = Post.create(title: Faker::Lorem.paragraph(sentence_count: 1), body: Faker::Lorem.paragraph(sentence_count: 3))
  puts post.attributes
end
