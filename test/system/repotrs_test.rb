# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:test_report)
    @user = users(:alice)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_path
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_path
    click_on '新規作成'

    fill_in 'タイトル', with: 'ゆかいな日報'
    fill_in '内容', with: 'わーい！'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text 'ゆかいな日報'
    assert_text 'わーい！'
  end

  test 'updating a Report' do
    visit reports_path
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_button '更新する'

    assert_text 'たのしい日報'
    assert_text 'たーのしー！'
    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Report' do
    visit reports_path
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
