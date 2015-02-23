module Launchboard
  class Keyboard
    attr_reader :keys
    def initialize
      @keys = []
      # qwerty - may add dvorak later?
      qwerty = %w(q w e r t y u i o p) +
               %w(a s d f g h j k l ;) +
               %w(z x c v b n m , . /) +
               %w(Q W E R T Y U I O P) +
               %w(A S D F G H J K L :) +
               %w(Z X C V B N M < > ?)
      qwerty.each do |key|
        @keys << Button.new(key)
      end
    end

    def key(qkey)
      @keys.find { |button| button.key == qkey }
    end

    def row(number, portion=:full)
      # convert number to Array style, and calculate portion range
      number -= 1
      case portion
      when :left
        range = (0 + (number * 10) .. 4 + (number * 10))
      when :right
        range = (5 + (number * 10) .. 9 + (number * 10))
      else
        range = (0 + (number * 10) .. 9 + (number * 10))
      end
      @keys[range]
    end
  end
end
