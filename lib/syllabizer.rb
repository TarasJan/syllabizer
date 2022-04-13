# frozen_string_literal: true

require_relative "syllabizer/version"
require_relative "syllabizer/state_machine"
require_relative "syllabizer/word"

module Syllabizer
  class Error < StandardError; end
  
  def self.count_syllables(word)
    Word.new(word).syllable_size
  end
end
