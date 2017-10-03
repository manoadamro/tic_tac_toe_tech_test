require('./lib/board')

describe 'Board' do
  subject { Board.new(3) }

  describe '#new' do
    it 'responds to new' do
      expect(Board).to respond_to(:new).with(0).arguments
    end

    it 'can pass optional size parameter' do
      expect(Board).to respond_to(:new).with(1).arguments
    end

    it 'can reference size' do
      expect(subject).to respond_to(:size)
    end

    it 'sets default size' do
      expect(subject).not_to eq(nil)
    end

    it 'can override default board size' do
      expect(Board.new(5).size).to eq(5)
    end

    it 'can reference tiles' do
      expect(subject).to respond_to(:tiles)
    end

    it 'creates a board array with correct number of tiles' do
      expect(subject.tiles.length).to eq(9)
    end

    it 'inital values of board array are nil' do
      ok = true
      subject.tiles.each do |tile|
        ok = false unless tile.nil?
      end
      expect(ok).to eq(true)
    end
  end

  describe '#place' do
    it 'responds to place' do
      expect(subject).to respond_to(:place).with(3).arguments
    end

    it 'can place on empty tile' do
      expect(subject.place('X', 1, 1)).to eq(true)
    end

    it 'can not place on taken tile' do
      subject.place('X', 1, 1)
      expect(subject.place('X', 1, 1)).to eq(false)
    end

    it 'places at correct index' do
      subject.place('X', 1, 1)
      expect(subject.tiles[4]).to eq('X')
    end
  end
end
