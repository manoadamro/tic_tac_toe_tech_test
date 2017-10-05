require('./lib/comparison')

describe 'Comparison' do
  let(:board) { double(:board) }
  subject { Comparison.new(board) }

  describe '#new' do
    it 'responds to new' do
      expect(Comparison).to respond_to(:new)
    end

    it 'sets board' do
      expect(subject.board).not_to eq(nil)
    end
  end

  describe '#match' do
    it 'responds to match' do
      expect(subject).to respond_to(:match)
    end

    it 'gets values for each element' do
      expect(board).to receive(:tile).and_return('X').exactly(3).times
      subject.match([1, 0], [1, 1], [1, 2])
    end
  end
end
