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
        let(:input) { '20\n30\n50'}
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

    context 'when input string can have dynamic delimiters' do
      context 'when comma is delimiter' do
        let(:input) { '//,\n30,50'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(80)
        end
      end

      context 'when semi-colon is delimiter' do
        let(:input) { '//:\n20:30:50'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(100)
        end
      end

      context 'when string is delimiter' do
        let(:input) { '//i am delimiter\n20i am delimiter30i am delimiter50i am delimiter100'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(200)
        end
      end

      context 'when number is delimiter' do
        let(:input) { '//10001\n20100013010001501000110010001100'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(300)
        end
      end
    end
  end
end
