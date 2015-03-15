module Launchboard
  class Receiver
    def do
      $stderr.puts("#{self.display} #do should be replaced")
    end
  end
end
