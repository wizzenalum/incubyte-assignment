require './string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:input) { '' }
    context 'when input string is empty' do
      it 'return zero' do
        expect(described_class.add(input)).to be(0)
      end
    end

    context 'when input string has single integer number' do
      let(:input) {'10'}
      it 'return the number' do
        expect(described_class.add(input)).to be(10)
      end
    end

    context 'when input string has comma separated two integer numbers' do
      let(:input) {'10, 20'}
      it 'return the sum of numbers' do
        expect(described_class.add(input)).to be(30)
      end
    end
  end
end
