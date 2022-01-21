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
    assert_equal true, Relationship.where(following_id: 100, follower_id: 101).exists?
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
    me = User.create!(email: 'me@example.com', password: 'password')
    he = User.create!(email: 'she@example.com', password: 'password')

    me.follow(he)
    assert me.following?(he)
    me.unfollow(he)
    assert_not me.following?(he)
  end
end
