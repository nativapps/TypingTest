class TestBank < ApplicationRecord
  has_many :has_tests, :dependent => :destroy
  has_many :rooms, through: :has_tests

  after_destroy :destroy_has_test

  def destroy_has_test
    HasTest.where("test_bank_id=?", id).delete_all
  end
end
