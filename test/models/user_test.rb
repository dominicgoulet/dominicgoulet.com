# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  # Test validations
  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should be invalid without an email" do
    @user.email = nil
    assert_not @user.valid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test "should be invalid with a malformed email" do
    @user.email = "invalid_email"
    assert_not @user.valid?
    assert_includes @user.errors[:email], "is invalid"
  end

  test "should be invalid without a password" do
    @user.password = nil
    assert_not @user.valid?
    assert_includes @user.errors[:password], "can't be blank"
  end

  test "should be invalid if password and password_confirmation do not match" do
    @user.password_confirmation = "different_password"
    assert_not @user.valid?
    assert_includes @user.errors[:password_confirmation], "doesn't match Password"
  end

  test "should be invalid with a short password" do
    @user.password = @user.password_confirmation = "short"
    assert_not @user.valid?
    assert_includes @user.errors[:password], "is too short (minimum is 6 characters)"
  end

  # Devise specific tests
  test "should respond to devise modules" do
    assert_includes User.devise_modules, :database_authenticatable
    assert_includes User.devise_modules, :validatable
  end
end
