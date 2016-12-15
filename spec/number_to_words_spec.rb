require 'spec_helper'
require 'number_to_words'
require 'pry'

RSpec.describe NumberToWords do
  subject { NumberToWords }

  describe '.convert_until_thousand_until_thousand' do
    it 'convert_until_thousands a single number' do
      expect(subject.convert_until_thousand(3)).to eq("three")
      expect(subject.convert_until_thousand(5)).to eq("five")
      expect(subject.convert_until_thousand(9)).to eq("nine")
    end

    it 'convert_until_thousands a multiple of ten' do
      expect(subject.convert_until_thousand(10)).to eq("ten")
      expect(subject.convert_until_thousand(30)).to eq("thirty")
      expect(subject.convert_until_thousand(50)).to eq("fifty")
    end

    it 'convert_until_thousands a multiple of ten with a single number' do
      expect(subject.convert_until_thousand(23)).to eq("twenty three")
      expect(subject.convert_until_thousand(58)).to eq("fifty eight")
      expect(subject.convert_until_thousand(72)).to eq("seventy two")
    end

    it 'convert_until_thousands one hundred something' do
      expect(subject.convert_until_thousand(128)).to eq("one hundred twenty eight")
      expect(subject.convert_until_thousand(162)).to eq("one hundred sixty two")
      expect(subject.convert_until_thousand(189)).to eq("one hundred eighty nine")
    end

    it 'convert_until_thousands X hundred something' do
      expect(subject.convert_until_thousand(328)).to eq("three hundred twenty eight")
      expect(subject.convert_until_thousand(462)).to eq("four hundred sixty two")
      expect(subject.convert_until_thousand(889)).to eq("eight hundred eighty nine")
      expect(subject.convert_until_thousand(999)).to eq("nine hundred ninety nine")
    end
  end

  describe '.convert' do
    it 'convert more than one thousand' do
      expect(subject.convert(1328)).to eq("one thousand three hundred twenty eight")
      expect(subject.convert(11328)).to eq("eleven thousand three hundred twenty eight")
      expect(subject.convert(11111999)).to eq("eleven million one hundred eleven thousand nine hundred ninety nine")
    end
  end
end
