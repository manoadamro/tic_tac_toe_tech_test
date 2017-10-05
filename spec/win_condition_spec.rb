require('./lib/win_condition')

describe 'Win Condition' do
  let(:board) { double(:board) }
  let(:turn_manager) { double(:turn_manager) }
  let(:algorithm_klass) { double(:algorithm_klass) }
  let(:algorithm) { double(:algorithm) }
  subject { WinCondition.new(board, turn_manager, algorithm_klass) }

  before do
    allow(algorithm_klass).to receive(:new).and_return(algorithm)
    allow(board).to receive(:sqr_size).and_return(9)
  end

  describe '#new' do
    it 'responds to new' do
      expect(WinCondition).to respond_to(:new).with(2).arguments
    end

    it 'algorithm parameter is optional' do
      expect(WinCondition).to respond_to(:new).with(3).arguments
    end

    it 'creates instance of algorithm' do
      expect(algorithm_klass).to receive(:new)
      WinCondition.new(board, turn_manager, algorithm_klass)
    end
  end

  describe '#check_for_win' do
    before do
      allow(board).to receive(:sqr_size).and_return(9)
      allow(turn_manager).to receive(:turns)
      allow(algorithm).to receive(:run_pass)
    end

    it 'responds to check_for_win' do
      expect(subject).to respond_to(:check_for_win)
    end

    it 'checks turn count in turn_manager' do
      expect(turn_manager).to receive(:turns)
      subject.check_for_win('X')
    end

    it 'gets boards sqr_size' do
      expect(board).to receive(:sqr_size)
      subject.check_for_win('X')
    end

    it 'runs algorithm for check for 3 in a row' do
      expect(algorithm).to receive(:run_pass)
      subject.check_for_win('X')
    end
  end
end
