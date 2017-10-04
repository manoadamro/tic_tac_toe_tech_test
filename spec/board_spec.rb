require('./lib/board')

describe 'Board' do
  let(:tiles_klass) { double(:tiles_klass) }
  let(:tiles) { double(:tiles) }
  subject { Board.new(3, tiles_klass) }

  before do
    allow(tiles_klass).to receive(:new).and_return(tiles)
    allow(tiles).to receive(:[])
  end

  describe '#new' do
    it 'responds to new' do
      expect(Board).to respond_to(:new).with(0).arguments
    end

    it 'can pass optional size parameter' do
      expect(Board).to respond_to(:new).with(1).arguments
    end

    it 'can pass optional tiles parameter' do
      expect(Board).to respond_to(:new).with(2).arguments
    end

    it 'creates an instance of tiles' do
      expect(tiles_klass).to receive(:new)
      Board.new(3, tiles_klass)
    end

    it 'can reference sqr_size' do
      expect(subject).to respond_to(:sqr_size)
    end

    it 'gets length from tiles' do
      expect(tiles).to receive(:length)
      subject.sqr_size
    end
  end

  describe '#place' do
    it 'responds to place' do
      expect(subject).to respond_to(:place).with(3).arguments
    end

    it 'checks that tile is available' do
      expect(tiles).to receive(:[])
      subject.place('X', 1, 1)
    end

    it 'sets tile if available' do
      allow(subject).to receive(:available?).and_return(true)
      expect(tiles).to receive(:[]=).with(1, 1, 'X')
      subject.place('X', 1, 1)
    end

    it 'does not set tile if not available' do
      allow(subject).to receive(:available?).and_return(false)
      expect(tiles).not_to receive(:[]=)
      subject.place('X', 1, 1)
    end
  end

  describe '#tile' do
    it 'responds to tile' do
      expect(subject).to respond_to(:tile)
    end

    it 'gets tile from tiles' do
      expect(tiles).to receive(:[]).with(1, 1).exactly(1).times
      subject.tile(1, 1)
    end
  end
end
