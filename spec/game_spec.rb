require 'active_support/all'
require 'date'
require_relative '../classes/game'

describe Game do
  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago' do
      it 'returns true' do
        game = Game.new(true, (Date.today - 2.years - 1.day).to_s, Date.today - 1.year)
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when last played less than 2 years ago' do
      it 'returns false' do
        game = Game.new(true, (Date.today - 1.year).to_s, Date.today - 1.year)
        expect(game.can_be_archived?).to be false
      end
    end

    context 'when the game was published more than 10 years ago' do
      it 'returns true' do
        game = Game.new(true, (Date.today - 1.year).to_s, Date.today - 11.years)
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the game was published less than 10 years ago' do
      it 'returns false' do
        game = Game.new(true, (Date.today - 1.year).to_s, Date.today - 9.years)
        expect(game.can_be_archived?).to be false
      end
    end
  end
end
