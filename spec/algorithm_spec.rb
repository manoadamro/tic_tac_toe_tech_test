require('./lib/algorithm')

describe 'Algorithm' do
  let(:board) { double(:board) }
  let(:matcher_klass) { double(:matcher_klass) }
  let(:matcher) { double(:matcher) }
  subject { Algorithm.new(board, matcher_klass) }

  before do
    allow(matcher_klass).to receive(:new).and_return(matcher)
  end

  describe '#new' do
    it 'responds to new' do
      expect(Algorithm).to respond_to(:new).with(1).arguments
    end

    it 'creates a matcher instance' do
      expect(matcher_klass).to receive(:new)
      Algorithm.new(board, matcher_klass)
    end
  end

  describe '#run_pass' do
    before do
      allow(board).to receive(:size).and_return(9)
    end

    it 'responds to run_pass' do
      expect(subject).to respond_to(:run_pass).with(0).arguments
    end

    it 'calls matcher.row_or_column?' do
      allow(matcher).to receive(:row_or_column?).and_return(true)
      expect(matcher).to receive(:row_or_column?)
      subject.run_pass
    end

    it 'calls matcher.diagonal?' do
      allow(matcher).to receive(:row_or_column?).and_return(false)
      allow(matcher).to receive(:diagonal?).and_return(false)
      expect(matcher).to receive(:row_or_column?)
      subject.run_pass
    end

    it 'returns false on no match' do
      allow(matcher).to receive(:row_or_column?).and_return(false)
      allow(matcher).to receive(:diagonal?).and_return(false)
      expect(subject.run_pass).to eq(false)
    end

    it 'returns true on column/row match' do
      allow(matcher).to receive(:row_or_column?).and_return(true)
      expect(subject.run_pass).to eq(true)
    end

    it 'returns true on diagonal match' do
      allow(matcher).to receive(:row_or_column?).and_return(false)
      allow(matcher).to receive(:diagonal?).and_return(true)
      expect(subject.run_pass).to eq(true)
    end
  end
end
