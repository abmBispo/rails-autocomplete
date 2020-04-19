# frozen_string_literal: true

require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  test 'should get create' do
    post posts_path(post: { title: 'Nunca é demais',
                           body: 'Nunca é demais lembrar o peso e o significado destes problemas'\
                                 ', uma vez que o início da atividade geral é válida.' })
    assert_response :success
  end

  test 'should get index' do
    get posts_path
    assert_response :success
  end
end
