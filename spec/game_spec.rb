require 'test/unit'
require_relative '../classes/item'
require_relative '../classes/game'

class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new(true, '2019-10-01', '2020-01-01')
  end

  def test_id_should_be_generated_randomly
    assert_not_nil(@game.instance_variable_get(:@id))
  end

  def test_multiplayer_should_be_accessible
    assert_respond_to(@game, :multiplayer)
    assert_respond_to(@game, :multiplayer=)
  end

  def test_last_played_at_should_be_accessible
    assert_respond_to(@game, :last_played_at)
    assert_respond_to(@game, :last_played_at=)
  end

  def test_can_be_archived_should_return_true_when_over_2_years_old
    @game.last_played_at = '2018-12-31'
    assert_equal true, @game.can_be_archived?
  end

  def test_can_be_archived_should_return_false_when_under_2_years_old
    @game.last_played_at = '2020-01-01'
    assert_equal false, @game.can_be_archived?
  end

  def test_can_be_archived_should_return_true_when_super_can_be_archived_is_true
    @game.publish_date = '2000-01-01'
    assert_equal true, @game.can_be_archived?
  end
end