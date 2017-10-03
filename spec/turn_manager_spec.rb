require('./lib/turn_manager')

describe 'Turn Manager' do
  let(:board) { double(:board) }
  let(:player1) { double(:player1) }
  let(:player2) { double(:player2) }
  let(:players) { [player1, player2] }
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

    it 'can reference current_turn' do
      expect(subject).to respond_to(:current_turn)
    end

    it 'current_turn starts at 0' do
      expect(subject.current_turn).to eq(0)
    end
  end

  describe '#turn' do
    before do
      allow(player1).to receive(:plays).and_return(0)
      allow(player1).to receive(:plays=).and_return(0)
    end

    it 'responds to turn' do
      expect(subject).to respond_to(:turn).with(2).arguments
    end

    it 'calls board.place' do
      expect(board).to receive(:place).exactly(1).times
      subject.turn(1, 1)
    end

    it 'increments current_turn on valid placement' do
      allow(board).to receive(:place).and_return(true)
      subject.turn(1, 2)
      expect(subject.current_turn).to eq(1)
    end

    it 'does not increment current_turn on invalid placement' do
      allow(board).to receive(:place).and_return(false)
      subject.turn(1, 2)
      expect(subject.current_turn).to eq(0)
    end

    it 'increments player.plays on valid placement' do
      allow(board).to receive(:place).and_return(true)
      expect(player1).to receive(:plays).exactly(1).times
      subject.turn(1, 2)
    end

    it 'does not increment current_turn on invalid placement' do
      allow(board).to receive(:place).and_return(false)
      expect(player1).not_to receive(:plays)
      subject.turn(1, 2)
    end
  end
end
