# frozen_string_literal: true

module Syllabizer
  class StateMachine
    attr_reader :accumulator, :acc_increase_positions

    def initialize
      @state = :ø
      @accumulator = 0
      @processed_transitions = 0
      @acc_increase_positions = []
    end

    def process_states(switches)
      switches.each do |switch|
        n_state = next_state(switch)
        @state = n_state
      end
    end

    private

    def next_state(symbol_switch)
      @processed_transitions += 1
      case @state
      when :ø
        case symbol_switch
        when %i[ø c], %i[ø s]
          :c
        when %i[ø v], %i[ø e]
          increase_accumulator
          :v
        else
          :ø
        end
      when :c
        case symbol_switch
        when %i[c e]
          :e
        when %i[c c], %i[s c], %i[s s], %i[c s]
          :cg
        when %i[c v]
          increase_accumulator
          :v
        else
          :c
        end
      when :cg
        case symbol_switch
        when %i[c v]
          increase_accumulator
          :v
        when %i[c e]
          increase_accumulator
          :v
        else
          :cg
        end
      when :v
        case symbol_switch
        when %i[e c], %i[e s], %i[v s], %i[v c], %i[ø c], %i[ø s]
          :c
        else
          :v
        end
      when :e
        case symbol_switch
        when %i[e c]
          increase_accumulator
          :c
        when %i[e s]
          :s
        when %i[e v], %i[e e]
          increase_accumulator
          :v
        else
          :e
        end
      when :s
        case symbol_switch
          when %i[s c]
            increase_accumulator
            :cg
          when %i[s e]
            increase_accumulator
            :e
          when %i[s v]
            increase_accumulator
            :v
        end
      end
    end

    def increase_accumulator
      @accumulator += 1
      @acc_increase_positions << @processed_transitions
    end
  end
end
