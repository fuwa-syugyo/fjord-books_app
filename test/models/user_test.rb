# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow' do
    me = users(:bob)
    she = users(:alice)

    me.follow(she)
    assert me.followings.where(id: she.id).exists?
    assert she.followers.where(id: me.id).exists?
  end

  test '#following?' do
    me = users(:bob)
    she = users(:alice)

    me.follow(she)
    assert me.following?(she)
  end

  test '#followed_by?' do
    me = users(:bob)
    she = users(:alice)

    me.follow(she)
    assert she.followed_by?(me)
  end

  test '#unfollow' do
    me = users(:bob)
    she = users(:alice)

    me.follow(she)
    assert me.followings.where(id: she.id).exists?
    assert she.followers.where(id: me.id).exists?

    me.unfollow(she)
    assert_not me.followings.where(id: she.id).exists?
    assert_not she.followers.where(id: me.id).exists?
  end
end
