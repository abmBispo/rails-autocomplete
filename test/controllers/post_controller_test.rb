# frozen_string_literal: true

require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test 'should create post' do
    post posts_path(title: 'Nunca é demais',
                    body: 'Nunca é demais lembrar o peso e o significado destes problemas'\
                          ', uma vez que o início da atividade geral é válida.')
    assert_response :success
  end

  test 'should get error on create post' do
    post posts_path(title: 'Nunca é demais',
                    body: 'Nunca é demais lembrar o peso e o significado destes problemas'\
                          ', uma vez que o início da atividade geral é válida'\
                          ', uma vez que o início da atividade geral é válida.')
    assert_response 406
  end

  test 'should get index' do
    Post.reindex
    get posts_path
    assert_response :success
  end
end
