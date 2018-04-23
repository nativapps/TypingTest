class TestBank < ApplicationRecord
  has_many :has_tests, :dependent => :destroy
  has_many :rooms, through: :has_tests
end
