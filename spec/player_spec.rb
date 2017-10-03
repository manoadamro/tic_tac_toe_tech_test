require('./lib/player')

describe 'Player' do
  subject { Player.new('X') }

  describe '#new' do
    it 'responds to new' do
      expect(Player).to respond_to(:new).with(1).arguments
    end

    it 'can reference symbol' do
      expect(subject).to respond_to(:symbol)
    end

    it 'sets symbol' do
      expect(subject.symbol).to eq('X')
    end

    it 'can reference plays' do
      expect(subject).to respond_to(:plays)
    end

    it 'plays starts at 0' do
      expect(subject.plays).to eq(0)
    end
  end

  describe '#on_play' do
    it 'responds to on_play' do
      expect(subject).to respond_to(:on_play).with(0).arguments
    end

    it 'increments plays by 1' do
      subject.on_play
      expect(subject.plays).to eq(1)
    end
  end
end
