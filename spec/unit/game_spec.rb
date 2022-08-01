require_relative '../../lib/game'
require 'date'

RSpec.describe Game do
  let(:game) { Game.new(publish_date: '2020-08-01', multiplayer: true, last_played_at: '2022-08-01') }
  it 'is an Item' do
    expect(game).to be_an(Item)
  end

  it 'should have a multiplayer attribute' do
    expect(game).to have_attributes(multiplayer: true)
  end

  it 'should have a last_played_at attribute' do
    expect(game).to have_attributes(last_played_at: Date.parse('2022-08-01'))
  end

  describe '#can_be_archived?' do
    context 'when its published date is newer than 10 years and was last played less than 2 years ago' do
      it 'can not be archived' do
        game.move_to_archive

        expect(game.archived).to be(false)
      end
    end

    context 'when its published date is older than 10 years and was last played 2 or more years ago' do
      let(:game) { Game.new(publish_date: '2010-08-01', multiplayer: true, last_played_at: '2019-08-01') }
      it 'can be archived' do
        game.move_to_archive

        expect(game.archived).to be(true)
      end
    end
  end
end
