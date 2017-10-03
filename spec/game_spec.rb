require('./lib/game')

describe 'Game' do
  let(:player_klass) { double(:player_klass) }
  let(:player) { double(:player) }
  let(:board_klass) { double(:board_klass) }
  let(:board) { double(:board) }
  let(:turn_manager_klass) { double(:turn_manager_klass) }
  let(:turn_manager) { double(:turn_manager) }
  subject { Game.new(player_klass, board_klass, turn_manager_klass) }

  before do
    allow(player_klass).to receive(:new).and_return(player)
    allow(board_klass).to receive(:new).and_return(board)
    allow(turn_manager_klass).to receive(:new).and_return(turn_manager)
  end

  describe '#new' do
    it 'responds to new' do
      expect(Game).to respond_to(:new).with(3).arguments
    end

    it 'can reference turn manager' do
      expect(subject).to respond_to(:turn_manager)
    end

    it 'creates turn manager' do
      expect(subject.turn_manager).not_to eq(nil)
    end
  end

  describe '#play' do

    before do
      allow(turn_manager).to receive(:turn).and_return(1)
    end

    it 'responds to play' do
      expect(subject).to respond_to(:play)
    end

    it 'calls turn_manager.turn' do
      expect(turn_manager).to receive(:turn).and_return(1)
      subject.play(1, 1)
    end

    it 'outputs turn info after turn is played' do
      expect { subject.play(1, 1) }.to output("Player2s turn!\n").to_stdout
    end
  end
end
