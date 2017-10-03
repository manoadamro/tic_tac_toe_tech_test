require('./lib/turn_manager')

describe 'Turn Manager' do
  let(:board) { double(:board) }
  let(:players) { double(:players) }
  subject { TurnManager.new(players, board) }

  describe '#new' do
    it 'responds to new' do
      expect(TurnManager).to respond_to(:new).with(2).arguments
    end

    it 'can reference players' do
      expect(subject).to respond_to(:players)
    end

    it 'sets players' do
      expect(subject.players).to eq(players)
    end

    it 'can reference board' do
      expect(subject).to respond_to(:board)
    end

    it 'sets board' do
      expect(subject.board).to eq(board)
    end

    it 'can reference player_index' do
      expect(subject).to respond_to(:player_index)
    end

    it 'player_index starts at 0' do
      expect(subject.player_index).to eq(0)
    end
  end

  describe '#turn' do
    before do
      allow(players).to receive(:'[]').and_return('!')
    end

    it 'responds to turn' do
      expect(subject).to respond_to(:turn).with(2).arguments
    end

    it 'calls board.place' do
      expect(board).to receive(:place).exactly(1).times
      subject.turn(1, 1)
    end

    it 'increments player_index on valid placement' do
      allow(board).to receive(:place).and_return(true)
      subject.turn(1, 2)
      expect(subject.player_index).to eq(1)
    end

    it 'does not increment player_index on invalid placement' do
      allow(board).to receive(:place).and_return(false)
      subject.turn(1, 2)
      expect(subject.player_index).to eq(0)
    end
  end
end
