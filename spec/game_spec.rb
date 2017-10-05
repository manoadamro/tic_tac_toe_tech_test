require('./lib/game')

describe 'Game' do
  let(:board_klass) { double(:board_klass) }
  let(:board) { double(:board) }
  let(:turn_manager_klass) { double(:turn_manager_klass) }
  let(:turn_manager) { double(:turn_manager) }
  let(:win_condition_klass) { double(:win_condition_klass) }
  let(:win_condition) { double(:win_condition) }
  subject do
    Game.new(board_klass, turn_manager_klass, win_condition_klass)
  end

  before do
    allow(board_klass).to receive(:new).and_return(board)
    allow(turn_manager_klass).to receive(:new).and_return(turn_manager)
    allow(win_condition_klass).to receive(:new).and_return(win_condition)
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

    it 'can reference win condition' do
      expect(subject).to respond_to(:win_condition)
    end

    it 'creates win condition' do
      expect(subject.win_condition).not_to eq(nil)
    end
  end

  describe '#play' do
    before do
      allow(turn_manager).to receive(:turn).and_return(1)
      allow(turn_manager).to receive(:player_index).and_return(0)
      allow(win_condition).to receive(:check_for_win).and_return(false)
    end

    it 'responds to play' do
      expect(subject).to respond_to(:play)
    end

    it 'calls turn_manager.turn' do
      expect(turn_manager).to receive(:turn).and_return(1)
      subject.play(1, 1)
    end

    it 'calls win_condition.check_for_win' do
      expect(win_condition).to receive(:check_for_win)
      subject.play(1, 1)
    end
  end
end
