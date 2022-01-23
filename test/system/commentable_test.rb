# frozen_string_literal: true

require 'application_system_test_case'

class CommentableTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)
    @report = reports(:test_report)
    @user = users(:alice)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating a Coment for Book' do
    @comment = comments(:comment_for_book)
    visit root_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'Rubyの文法の基本をやさしくていねいに解説しています。'
    fill_in '著者', with: '五十嵐 邦明'
    click_button '登録する'

    click_on '戻る', match: :prefer_exact
    click_on '詳細', match: :prefer_exact

    fill_in 'comment[content]', with: @comment.content
    click_button 'コメントする'
    assert_text 'ほんだいすき'
  end

  test 'creating a Coment for Report' do
    @comment = comments(:comment_for_report)
    visit reports_path
    click_on '新規作成'

    fill_in 'タイトル', with: '1日目'
    fill_in '内容', with: 'がんばりました！'
    click_button '登録する'

    click_on '戻る', match: :prefer_exact
    click_on '詳細', match: :prefer_exact

    fill_in 'comment[content]', with: @comment.content
    click_button 'コメントする'
    assert_text 'にっぽうだいすき'
  end
end
