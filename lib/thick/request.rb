module Thick
  class Request
    def initialize(request)
      @request = request
    end
    
    def method
      @request.get_method
    end
    
    def method_missing(name, *args)
      @request.send(name, *args)
    end
  end
end