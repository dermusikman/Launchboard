module Launchboard
  class Button
    attr_reader :key
    attr_accessor :action
    def initialize(key, action=nil)
      @key = key
      @action = action
    end

    def press
      @action.enact
    end
  end
end
