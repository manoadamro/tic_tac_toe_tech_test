require('./lib/messages')

describe 'Messages' do
  let(:kernel) { double(:kernel) }
  subject { Messages.new(kernel) }

  before do
    allow(kernel).to receive(:exit).and_return(nil)
    allow(kernel).to receive(:puts).and_return(nil)
    allow(kernel).to receive(:to).and_return(nil)
  end

  describe '#win' do
    it 'responds to win' do
      expect(subject).to respond_to(:win)
    end

    it 'tells players who won' do
      expect(kernel).to receive(:puts).with('X wins!')
      subject.win('X')
    end

    it 'exits' do
      expect(kernel).to receive(:exit)
      subject.win('X')
    end
  end

  describe '#draw' do
    it 'responds to draw' do
      expect(subject).to respond_to(:draw)
    end

    it 'tells players that the result was a draw' do
      expect(kernel).to receive(:puts).with('Draw!')
      subject.draw
    end

    it 'exits' do
      expect(kernel).to receive(:exit)
      subject.draw
    end
  end
end
