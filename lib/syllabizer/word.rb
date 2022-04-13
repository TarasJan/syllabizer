# frozen_string_literal: true

module Syllabizer
  class Word
    DEFAULT_SEPARATOR = "-"

    def initialize(word)
      @word = word
      @state_machine = StateMachine.new
      process(word)
    end

    def syllable_size
      @state_machine.accumulator
    end

    def to_s
      base = @word.chars
      breaks = @state_machine.acc_increase_positions[0...-1]
      offset = 0
      breaks.each do |index|
        base.insert(index, DEFAULT_SEPARATOR)
        offset += 1
      end
      base.join
    end

    private

    def process(word)
      buffer = word.chars << nil
      nodes = buffer.rotate(-1).zip(buffer)
      transitions = nodes.map { |c| c.map { |char| char_to_sym(char) } }
      @state_machine.process_states(transitions)
      @state_machine.accumulator
    end

    def char_to_sym(char)
      case char
      when /e/
        :e
      when /[aiouy]/
        :v
      when /[qwrtpsfghjklzxcvbnm]/
        :c
      else
        :ø
      end
    end
  end
end
