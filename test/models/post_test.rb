# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'save valid post should work' do
    post = Post.new(title: 'Nunca é demais',
                    body: 'Nunca é demais lembrar o peso e o significado destes'\
                          'problemas, uma vez que o início da atividade geral de')
    assert post.save
  end

  test 'save invalid (null title) should not work' do
    post = Post.new(body: 'Nunca é demais lembrar o peso e o significado destes'\
                          'problemas, uma vez que o início da atividade geral de'\
                          'formação de atitudes faz parte de um processo de')
    assert_not post.save, 'Saved post without title.'
  end

  test 'save invalid (empty body) should not work' do
    post = Post.new(title: 'Nunca é demais')
    assert_not post.save, 'Saved post without body.'
  end

  test 'save too long title text' do
    post = Post.new(title: 'Nunca é demais gerenciamento de todos os recursos funcionais envolvidos.',
                    body: 'Nunca é demais lembrar o peso e o significado destes'\
                          'problemas, uma vez que o início da atividade geral de'\
                          'formação de atitudes faz parte de um processo de')
    assert_not post.save, 'Saved post with too long body title.'
  end

  test 'save too long body text' do
    post = Post.new(title: 'Nunca é demais',
                    body: 'Nunca é demais lembrar o peso e o significado destes'\
                          'problemas, uma vez que o início da atividade geral de'\
                          'formação de atitudes faz parte de um processo de'\
                          'gerenciamento de todos os recursos funcionais envolvidos.')
    assert_not post.save, 'Saved post with too long body text.'
  end
end
