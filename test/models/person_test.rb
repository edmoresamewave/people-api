require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @person = people(:one)
  end

  test 'valid' do
    assert @person.valid?
  end

  test 'first_name is required' do
    refute Person.new(last_name: "Moyo").valid?
  end

  test 'last_name is required' do
    refute Person.new(first_name: "Graeme").valid?
  end
end
