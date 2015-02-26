module Launchboard
  class Action
    attr_accessor :start_action, :end_action, :receiver
    attr_reader :loop_on

    def initialize(receiver, start_action, end_action='')
      @receiver = receiver
      @start_action = start_action
      @end_action = end_action
      @loop_on = false
    end

    def loops?
      @end_action.empty? ? false : true
    end

    def enact
      if @loop_on
        @receiver.do(@end_action)
        @loop_on = false
      else
        @receiver.do(@start_action)
        @loop_on = true if loops?
      end
    end
  end
end
