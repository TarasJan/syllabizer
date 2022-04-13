# frozen_string_literal: true

require 'spec_helper'

describe Syllabizer do
  it 'has the correct version' do
    expect(Syllabizer::VERSION).to eql('0.1.0')
  end

  describe "#count_syllables" do
    subject(:syllabe_count) { Syllabizer.count_syllables(word) }

    context "one syllable word" do
      let(:word) { 'court' }

      it 'has one syllable' do
        expect(syllabe_count).to eql 1
      end
    end

    context "one syllable word with silent e" do
      let(:word) { 'race' }

      it 'has one syllable' do
        expect(syllabe_count).to eql 1
      end
    end

    context "two syllable word with loud e" do
      let(:word) { 'apple' }

      it 'has two syllables' do
        expect(syllabe_count).to eql 2
      end
    end

    context "three syllable word with silent e" do
      let(:word) { 'magistrate' }

      it 'has three syllables' do
        expect(syllabe_count).to eql 3
      end
    end
  end
end