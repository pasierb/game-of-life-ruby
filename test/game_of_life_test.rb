require 'minitest/autorun'
require_relative '../game_of_life'

class GameOfLifeTest < MiniTest::Unit::TestCase

  class Runner
    include GameOfLife
  end

  def setup
    @runner = Runner.new
  end

  def test_simple_single_cell
    stage = [[false, true, false]]

    assert_equal [[false, false, false]], @runner.simulate(stage)
  end

  def test_neighbours
    world = [
      [nil, 1, nil],
      [1, 1, nil]
    ]

    assert_equal 2, @runner.neighbours(world, 1, 1)
  end

  def test_empty_neighbours
    world = [[]]

    assert_equal 0, @runner.neighbours(world, 0, 0)
  end
end
