module Launchboard
  class Button
    attr_reader :key
    attr_accessor :action
    def initialize(key, action=nil)
      @key = key
      @action = action
    end

    def press
      begin
        @action.enact
      rescue
        $stderr.puts "\'#{@key}\' pressed, but no action is associated"
      end
    end
  end

  class Keyboard
    attr_reader :key_hash, :key_array
    def initialize
      @key_hash  = {}
      # qwerty - may add dvorak later?
      @key_array = %w(q w e r t y u i o p) +
                   %w(a s d f g h j k l ;) +
                   %w(z x c v b n m , . /) +
                   %w(Q W E R T Y U I O P) +
                   %w(A S D F G H J K L :) +
                   %w(Z X C V B N M < > ?)
      @key_array.each do |key|
        @key_hash[key] = Button.new(key)
      end
    end

    def key(qkey)
      @key_hash[qkey]
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

      keys = []
      @key_array[range].each do |key|
        keys << @key_hash[key]
      end
      keys
    end

    def column(number, portion=:full)
      # convert number to Array style, and calculate portions
      number -= 1
      case portion
      when :top
        rows = (0 .. 2)
      when :bottom
        rows = (3 .. 5)
      else
        rows = (0 .. 5)
      end
      keys = []
      rows.each do |row|
        k = (row * 10) + number
        keys << @key_hash[@key_array[k]]
      end
      keys
    end
  end
end
