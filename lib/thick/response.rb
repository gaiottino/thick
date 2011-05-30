module Thick
  class Response
    def initialize(response)
      @response = response
    end
    
    def <<(s)
      @response.writer.println(s)
    end

    def method_missing(name, *args)
      @response.send(name, *args)
    end
  end
end