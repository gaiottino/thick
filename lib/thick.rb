# encoding: utf-8

require 'java'

Dir['lib/ext/*.jar'].each { |jar| require jar }

module Jetty
  import org.eclipse.jetty.server.Server;
  import org.eclipse.jetty.server.handler.AbstractHandler;
end

module Thick
  def self.server(options = {}, &block)
    raise ':port is a required option' unless options[:port]
    port = options[:port].to_i
    
    server = Jetty::Server.new(port)
    server.set_handler(Handler.new(&block))
    server.start
    server.join
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

require 'thick/request'
require 'thick/response'