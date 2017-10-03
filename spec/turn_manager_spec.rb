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

    it 'can reference turns' do
      expect(subject).to respond_to(:turns)
    end

    it 'turns starts at 0' do
      expect(subject.turns).to eq(0)
    end
  end

  describe '#turn' do
    before do
      allow(players).to receive(:'[]').and_return('!')
      allow(board).to receive(:place).and_return(true)
    end

    it 'responds to turn' do
      expect(subject).to respond_to(:turn).with(2).arguments
    end

    it 'calls board.place' do
      expect(board).to receive(:place).exactly(1).times
      subject.turn(1, 1)
    end

    it 'turn returns correct player index' do
      allow(subject).to receive(:turns).and_return(156)
      expect(subject.turn(1, 1)).to eq(1)
    end

    it 'increments turns on valid placement' do
      allow(board).to receive(:place).and_return(true)
      subject.turn(1, 2)
      expect(subject.turns).to eq(1)
    end

    it 'does not increment turns on invalid placement' do
      allow(board).to receive(:place).and_return(false)
      subject.turn(1, 2)
      expect(subject.turns).to eq(0)
    end
  end
end
