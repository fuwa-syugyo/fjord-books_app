# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    report = reports(:test_report)

    user = users(:alice)
    assert_equal true, report.editable?(user)

    user = users(:bob)
    assert_equal false, report.editable?(user)
  end

  test 'created_on' do
    report = reports(:test_report)
    assert_equal '2022/01/05', I18n.localize(report.created_on)
  end
end
