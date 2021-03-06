require './generators/fraction'

describe Fraction do
  describe '#initialize/new' do
    let(:fraction){described_class.new(2,3,4)}

    it 'initializes with a integer part' do
      expect(fraction.integer).to eq 2
    end
    it 'initializes with a denominator' do
      expect(fraction.numerator).to eq 3
    end
    it 'initializes with a numerator' do
      expect(fraction.denominator).to eq 4
    end
  end

  describe '#simplify' do
    let(:fraction1){described_class.new(3,6,8)}
    let(:fraction2){described_class.new(4,12,8)}

    context 'make fraction parts into lowest form' do
      it 'has new simplified numerator' do
        fraction1.simplify
        expect(fraction1.numerator).to eq 3
      end
      it 'has new simplified denominator' do
        fraction1.simplify
        expect(fraction1.denominator).to eq 4
      end
    end

    context 'make fraction part of a mixed fraction not top-heavy' do
      it 'has a new integer part' do
        fraction2.simplify
        expect(fraction2.integer).to eq 5
      end

      it 'has a new numerator' do
        fraction2.simplify
        expect(fraction2.numerator).to eq 1
      end

      it 'has a new denominator' do
        fraction2.simplify
        expect(fraction2.denominator).to eq 2
      end

      it 'is not top-heavy' do
        fraction2.simplify
        expect(fraction2.numerator <= fraction2.denominator).to eq true
      end
    end
  end

  describe '#==' do
    let(:fraction1){described_class.new(2,5,8)}
    let(:fraction2){described_class.new(2,5,8)}

    it 'two fractions to be equal if they have the same parts' do
      expect(fraction1 == fraction2).to be true
    end
  end

  describe '#>' do
    let(:fraction1){described_class.new(3,5,8)}
    let(:fraction2){described_class.new(2,5,8)}
    let(:fraction3){described_class.new(0,35,8)}
    let(:fraction4){described_class.new(1,26,16)}

    it 'is true when fraction is greater than another fraction' do
      expect(fraction1 > fraction2).to be true
    end

    it 'returns false when the two fractions are equal' do
      expect(fraction2 > fraction4).to be false
    end

    it 'can compare mixed and top-heavy fractions' do
      expect(fraction1 > fraction3).to be false
    end
  end

  describe '#<' do
    let(:fraction1){described_class.new(3,5,8)}
    let(:fraction2){described_class.new(2,5,8)}
    let(:fraction3){described_class.new(0,35,8)}
    let(:fraction4){described_class.new(1,26,16)}

    it 'is false when fraction is greater than another fraction' do
      expect(fraction1 < fraction2).to be false
    end

    it 'returns false when the two fractions are equal' do
      expect(fraction2 < fraction4).to be false
    end

    it 'can compare mixed and top-heavy fractions' do
      expect(fraction1 < fraction3).to be true
    end
  end

  describe '#same_value?' do
    let(:fraction1){described_class.new(2,5,8)}
    let(:fraction2){described_class.new(1,26,16)}

    it 'two fractions to be equal if they have the same simplified parts' do
      expect(fraction1.same_value?(fraction2)).to eq true
    end
  end

  describe '#mixed_to_topheavy' do
    let(:fraction1){described_class.new(2,5,8)}
    let(:fraction2){described_class.new(2,5,8)}

    it 'changes a mixed fraction into a top-heavy fraction' do
      new_fraction = fraction1.mixed_to_topheavy
      expect(new_fraction.integer).to eq 0
    end

    it 'does not change the original fraction' do
      fraction1.mixed_to_topheavy
      expect(fraction1.integer).to eq 2
    end

    it 'the changed mixed fraction has the same value as before' do
      fraction1.mixed_to_topheavy
      expect(fraction1.same_value?(fraction2)).to eq true
    end
  end

  describe '#topheavy_to_mixed' do
    let(:fraction1){described_class.new(0,21,8)}
    let(:fraction2){described_class.new(0,21,8)}

    it 'changes a top-heavy fraction into a mixed fraction' do
      new_fraction = fraction1.topheavy_to_mixed
      expect(new_fraction.integer).to eq 2
    end

    it 'does not change the original fraction' do
      fraction1.topheavy_to_mixed
      expect(fraction1.integer).to eq 0
    end

    it 'the changed top-heavy fraction has the same value as before' do
      fraction1.topheavy_to_mixed
      expect(fraction1.same_value?(fraction2)).to eq true
    end
  end

  describe '#add' do
    let(:fraction1){described_class.new(2,5,8)}
    let(:fraction2){described_class.new(4,5,6)}
    let(:result_fraction){described_class.new(7,11,24)}

    it 'adds a fraction to another fraction resulting in a new fraction' do
      expect(fraction1.add(fraction2)).to eq result_fraction
    end
  end

  describe '#subtract' do
    let(:fraction1){described_class.new(5,4,9)}
    let(:fraction2){described_class.new(2,2,3)}
    let(:result_fraction){described_class.new(2,7,9)}

    it 'subtracts a fraction from another fraction resulting in a new fraction' do
      expect(fraction1.subtract(fraction2)).to eq result_fraction
    end
  end

  describe '#multiply' do
    let(:fraction1){described_class.new(3,2,3)}
    let(:fraction2){described_class.new(2,3,4)}
    let(:result_fraction){described_class.new(10,1,12)}

    it 'multiply a fraction to another fraction resulting in a new fraction' do
      expect(fraction1.multiply(fraction2)).to eq result_fraction
    end
  end

  describe '#divide' do
    let(:fraction1){described_class.new(3,2,3)}
    let(:fraction2){described_class.new(2,3,4)}
    let(:result_fraction){described_class.new(1,1,3)}

    it 'divide a fraction from another fraction resulting in a new fraction' do
      expect(fraction1.divide(fraction2)).to eq result_fraction
    end
  end
end
