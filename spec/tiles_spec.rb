require('./lib/tiles')

describe 'Tiles' do

  let(:array_klass) { double(:array_klass) }
  let(:array) { double(:array) }

  subject { Tiles.new(3, array_klass) }

  before do
    allow(array_klass).to receive(:new).and_return(array)
    allow(array).to receive(:[])
    allow(array).to receive(:[]=)
    allow(array).to receive(:length).and_return(9)
  end

  describe '#new' do
    it 'responds to new' do
      expect(Tiles).to respond_to(:new)
    end
    it 'creates an array' do
      expect(array_klass).to receive(:new)
      Tiles.new(3, array_klass)
    end
  end

  describe '#[]' do

    it 'responds to []' do
      expect(subject).to respond_to(:[])
    end

    it 'responds to []=' do
      expect(subject).to respond_to(:[]=)
    end

    it '[]= sets array element' do
      expect(array).to receive(:[]=)
      subject[1, 1] = "X"
    end

    it 'returns tile if in range' do
      expect(subject[1, 1]).not_to eq('')
    end

    it 'does not return tile if out of range' do
      expect(subject[5, 5]).to eq(nil)
    end
  end

  describe '#length' do

    it 'responds to length' do
      expect(subject).to respond_to(:length)
    end

    it 'gets length from array' do
      expect(array).to receive(:length)
      subject.length
    end
  end
end
