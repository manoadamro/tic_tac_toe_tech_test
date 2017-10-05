require('./lib/tile_matcher')

describe 'TileMatcher' do
  let(:board) { double(:board) }
  let(:patterns) { double(:patterns) }
  let(:comparison_klass) { double(:comparison_klass) }
  let(:comparison) { double(:comparison) }
  subject { TileMatcher.new(board, patterns, comparison_klass) }

  before do
    eg_array = [[1, 1], [1, 1], [1, 1]]
    allow(comparison_klass).to receive(:new).and_return(comparison)
    allow(board).to receive_message_chain(:tile, :[]).and_return('')
    allow(comparison).to receive(:match).and_return(false)

    allow(patterns).to receive(:column).and_return(eg_array)
    allow(patterns).to receive(:row).and_return(eg_array)
    allow(patterns).to receive(:diagonal).and_return(eg_array)
    allow(patterns).to receive(:anti_diagonal).and_return(eg_array)
  end

  describe '#new' do
    it 'responds to new' do
      expect(TileMatcher).to respond_to(:new)
    end
  end

  describe '#row_or_column' do
    it 'calls patterns.column' do
      expect(patterns).to receive(:column)
      subject.row_or_column?(1)
    end

    it 'calls patterns.row' do
      allow(comparison).to receive(:match).and_return(false)
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
      allow(comparison).to receive(:match).and_return(false)
      expect(patterns).to receive(:anti_diagonal)
      subject.diagonal?
    end
  end
end
