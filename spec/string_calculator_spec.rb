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

      context 'when number is negative' do
        let(:input) {'-10'}
        it 'raise error' do
          expect{ described_class.add(input) }.to raise_error(ArgumentError, 'negative numbers not allowed <-10>')
        end
      end

      context 'when number is 1000' do
        let(:input) { '1000'}
        it 'return zero' do
          expect(described_class.add(input)).to be(1000)
        end
      end

      context 'when number is greater than 1000' do
        let(:input) { '1001'}
        it 'return zero' do
          expect(described_class.add(input)).to be(0)
        end
      end
    end

    context 'when input string has comma separated two integer numbers' do
      let(:input) {'10, 20'}
      it 'return the sum of numbers' do
        expect(described_class.add(input)).to be(30)
      end

      context 'when both numbers are negative' do
        let(:input) {'-10, -20'}
        it 'raise error' do
          expect{ described_class.add(input) }.to raise_error(ArgumentError, 'negative numbers not allowed <-10 -20>')
        end
      end

      context 'when one number equal to 1000 and another is greater than 1000' do
        let(:input) { '1000, 1001'}
        it 'return zero' do
          expect(described_class.add(input)).to be(1000)
        end
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

      context 'when few numbers are bigger than 1000' do
        let(:input) { '20, 30\n50,1002\n2000,100'}
        it 'return sum of  numbers while ignoring numbers bigger than 1000' do
          expect(described_class.add(input)).to be(200)
        end
      end

      context 'when some numbers are negative' do
        let(:input) {'20, -30\n50,10\n-20'}
        it 'raise error' do
          expect{ described_class.add(input) }.to raise_error(ArgumentError, 'negative numbers not allowed <-30 -20>')
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
        let(:input) { '//:\n20:30:50' }
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
        let(:input) { '//10001\n20100013010001501000110010001100' }
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(300)
        end
      end

      context 'when some numbers are negative' do
        let(:input) { '//;\n-20;30;50;-30;40;-100' }
        it 'raise error' do
          expect{ described_class.add(input) }.to raise_error(ArgumentError, 'negative numbers not allowed <-20 -30 -100>')
        end
      end

      context 'when few numbers are bigger than 1000' do
        let(:input) { '//:\n20:30:50:1000:30:1234:20'}
        it 'return sum of  numbers while ignoring numbers bigger than 1000' do
          expect(described_class.add(input)).to be(1150)
        end
      end
    end

    context 'when input string can have multiple dynamic delimiters' do
      context 'when , and ; are delimiters' do
        let(:input) { '//[,][;]\n30,50;100'}
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(180)
        end
      end

      context 'when @,$,%,&,* are delimiters' do
        let(:input) { '//[@][$][%][&][*]\n20*30&50%10$10@10$70' }
        it 'return sum of  numbers' do
          expect(described_class.add(input)).to be(200)
        end
      end

      context 'when some numbers are negative' do
        let(:input) { '//[;]["]\n-20;30"50;-30"40;-100' }
        it 'raise error' do
          expect{ described_class.add(input) }.to raise_error(ArgumentError, 'negative numbers not allowed <-20 -30 -100>')
        end
      end

      context 'when few numbers are bigger than 1000' do
        let(:input) { '//[:][#][$]\n20:30$50#1000:30$1234#20'}
        it 'return sum of  numbers while ignoring numbers bigger than 1000' do
          expect(described_class.add(input)).to be(1150)
        end
      end
    end
  end
end
