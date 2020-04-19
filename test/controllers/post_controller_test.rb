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

2
4
6
9
10
12
19
21
22
26
28
30
32
33
34
36
42
51
60
63
'74'
77
79
'96'
97

'2'
4
6
9
10
12
19
21
22
'26'
'28'
30
32
33
34
36
42
51
60
'63'
74
77
79
96
'97'
