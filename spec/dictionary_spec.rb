require 'spec_helper'


describe Syllabizer do
  subject(:syllabe_count) { Syllabizer.count_syllables(word) }

  pronunciation_words = open("spec/fixtures/cmudict.dict").readlines.map do |l|
    line = l.split(" ")
    word, *syls = line 
    [word, syls.count {|s| s =~ /[0-9]/}]
  end

  pronunciation_words.each do |word, expected_syllabe_count|
    context "Syllable count for word #{word}" do
      let(:word) { word }

      it "is equal to #{expected_syllabe_count}" do
        expect(syllabe_count).to eql expected_syllabe_count
      end
    end
  end
end

