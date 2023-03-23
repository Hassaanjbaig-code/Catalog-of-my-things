require_relative '../classes/item'
require_relative '../classes/game'
require 'date'

RSpec.describe Game do
  describe '#can_be_archived?' do
    context 'when the game was last played more than two years ago' do
      it 'returns true' do
        game = Game.new(true, '2018-01-01', '2021-01-01')
        expect(game.can_be_archived?).to eq(true)
      end
    end

    context 'when the game was last played less than two years ago' do
      it 'returns false' do
        game = Game.new(true, Date.today.to_s, '2021-01-01')
        expect(game.can_be_archived?).to eq(false)
      end
    end

    context 'when the game has not yet been published' do
      it 'returns false' do
        game = Game.new(true, '2018-01-01', Date.today.to_s)
        expect(game.can_be_archived?).to eq(false)
      end
    end

    context 'when the game has no multiplayer' do
      it 'returns false' do
        game = Game.new(false, '2018-01-01', '2021-01-01')
        expect(game.can_be_archived?).to eq(false)
      end
    end
  end
end
