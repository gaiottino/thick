module Thick
  class Response
    def initialize(response)
      @response = response
    end
    
    def <<(s)
      @response.writer.println(s)
    end
    
    def stream
      OutputStream.new(@response.output_stream)
    end
    
    def error=(sc)
      @response.send_error(sc)
    end

    def method_missing(name, *args)
      @response.send(name, *args)
    end
  end
end