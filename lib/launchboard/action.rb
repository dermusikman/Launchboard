module Launchboard
  class Action
    attr_accessor :start_action, :end_action, :loop, :state
    @start_action = ""
    @end_action = ""
    @loop = false
    @state = :off
    @receiver = nil

    def enabled?
      @start_action ? true : false
    end

    def loops?
      @loop ? true : false
    end

    def enact
      if @loop
        if @state == :off
          @receiver.send(@start_action)
          @state = :on
        else
          @receiver.send(@end_action)
        end
      else
        @receiver.send(@start_action)
      end
    end
  end
end
