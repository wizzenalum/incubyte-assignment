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

    context 'when input string has comma separated multiple integer numbers' do
      let(:array) { Array.new(Random.rand*20).map{|num| (Random.rand*100).to_i}}
      let(:input) {array.join(', ')}
      it 'return the sum of numbers' do
        expect(described_class.add(input)).to be(array.sum)
      end
    end

    context 'when input string has comma or newline separated numbers' do
      context 'when only newline separates the numbers' do
        let(:input) { '20\n30\n50\n'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(100)
        end
      end

      context 'when comma and newline separates the numbers' do
        let(:input) { '20, 30\n50'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(100)
        end
      end
    end
  end
end
