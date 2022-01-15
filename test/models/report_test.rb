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
end
