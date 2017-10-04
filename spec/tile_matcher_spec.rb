require('./lib/tile_matcher')

describe 'TileMatcher' do
  let(:board) { double(:board) }
  let(:patterns) { double(:patterns) }
  subject { TileMatcher.new(board, patterns) }

  before do
    allow(board).to receive(:tile).and_return('')
    allow(patterns).to receive(:column).and_return([[1, 1], [1, 1], [1, 1]])
    allow(patterns).to receive(:row).and_return([[1, 1], [1, 1], [1, 1]])
    allow(patterns).to receive(:diagonal).and_return([[1, 1], [1, 1], [1, 1]])
    allow(patterns).to receive(:anti_diagonal).and_return([[1, 1], [1, 1], [1, 1]])
  end

  describe '#new' do
    it 'responds to new' do
      expect(TileMatcher).to respond_to(:new)
    end

    it 'responds to board' do
      expect(subject).to respond_to(:board)
    end

    it 'sets to board' do
      expect(subject.board).not_to eq(nil)
    end
  end

  describe '#row_or_column' do
    it 'calls patterns.column' do
      expect(patterns).to receive(:column)
      subject.row_or_column?(1)
    end

    it 'calls patterns.row' do
      allow(board).to receive(:tile).and_return('X')
      expect(patterns).to receive(:row)
      subject.row_or_column?(1)
    end
  end

  describe '#diagonal' do
    it 'calls patterns.diagonal' do
      expect(patterns).to receive(:diagonal)
      subject.diagonal?
    end

    it 'calls patterns.anti_diagonal' do
      allow(board).to receive(:tile).and_return('X')
      expect(patterns).to receive(:anti_diagonal)
      subject.diagonal?
    end
  end
end
