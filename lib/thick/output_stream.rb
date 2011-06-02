module Thick
  class OutputStream
    def initialize(stream)
      @stream = stream
    end
    
    def <<(s)
      @stream.print(s)
    end
    
    def method_missing(name, *args)
      @stream.send(name, *args)
    end
  end
end