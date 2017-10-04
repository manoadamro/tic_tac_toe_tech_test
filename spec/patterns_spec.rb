require('./lib/patterns')

describe 'Patternss' do
  describe '#column' do
    it 'should respond to column' do
      expect(Patterns).to respond_to(:column)
    end

    it 'should return an array' do
      expect(Patterns.column(1)).to be_a(Array)
    end

    it 'returned array should have 3 elements' do
      expect(Patterns.column(1).length).to eq(3)
    end
  end

  describe '#row' do
    it 'should respond to row' do
      expect(Patterns).to respond_to(:row)
    end

    it 'should return an array' do
      expect(Patterns.row(1)).to be_a(Array)
    end

    it 'returned array should have 3 elements' do
      expect(Patterns.row(1).length).to eq(3)
    end
  end

  describe '#diagonal' do
    it 'should respond to diagonal' do
      expect(Patterns).to respond_to(:diagonal)
    end

    it 'should return an array' do
      expect(Patterns.diagonal).to be_a(Array)
    end

    it 'returned array should have 3 elements' do
      expect(Patterns.diagonal.length).to eq(3)
    end
  end

  describe '#anti_diagonal' do
    it 'should respond to diagonal' do
      expect(Patterns).to respond_to(:anti_diagonal)
    end

    it 'should return an array' do
      expect(Patterns.anti_diagonal).to be_a(Array)
    end

    it 'returned array should have 3 elements' do
      expect(Patterns.anti_diagonal.length).to eq(3)
    end
  end
end
