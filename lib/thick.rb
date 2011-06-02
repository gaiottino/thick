# encoding: utf-8

require 'java'

module Jetty
  require 'ext/jetty-continuation-7.4.1.v20110513'
  require 'ext/jetty-http-7.4.1.v20110513'
  require 'ext/jetty-io-7.4.1.v20110513'
  require 'ext/jetty-server-7.4.1.v20110513'
  require 'ext/jetty-util-7.4.1.v20110513'
  require 'ext/servlet-api-2.5'

  import org.eclipse.jetty.server.Server;
  import org.eclipse.jetty.server.handler.AbstractHandler;
end

module Thick
  include Jetty

  class Server
    def initialize(options = {})
      raise ':port is a required option' unless options[:port]
      port = options[:port].to_i
      @server = Jetty::Server.new(port)
    end
  
    def start(&block)
      @server.set_handler(Handler.new(&block))
      @server.start
      # servera.join
    end
  
    def stop
      @server.stop
    end
  
  private
  
    class Handler < Jetty::AbstractHandler
      def initialize(&block)
        @block = block
      end
    
      def handle(target, base_request, request, response)
        base_request.set_handled(true)
        @block.call(target, Request.new(request), Response.new(response))
      end
    end
  end
end

require 'thick/request'
require 'thick/response'
require 'thick/output_stream'