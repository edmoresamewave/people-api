require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  setup do
    @goal = goals(:one)
  end

  test 'valid' do
    assert @goal.valid?
  end

  test 'title is required' do
    invalid_goal = goals(:invalid)
    refute invalid_goal.valid?
  end

  test 'score between 1 and 10' do
    invalid_score1 = goals(:invalid_score1)
    invalid_score2 = goals(:invalid_score2)

    refute invalid_score1.valid?
    refute invalid_score2.valid?
  end

  test '#goals returns an persons goals' do

  end
end
