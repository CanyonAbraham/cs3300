require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!



RSpec.describe User, type: :model do
  subject {
    User.new(email: "johnDoe@gmail.com", password: "password")
  }

  it "is valid with an email and password" do
    expect(subject).to be_valid
  end

  it "is not valid without an email address" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end