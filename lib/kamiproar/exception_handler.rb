module Kamiproar
  class ExceptionHandler
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] =~ /\/api/
        env['action_dispatch.show_exceptions'] = false
        begin
          begin
            @app.call(env)
          rescue ActiveRecord::RecordNotFound
            raise Exceptions::InternalServerError
          rescue
            raise Exceptions::InternalServerError
          end
        rescue Exceptions::Base => e
          e.to_rack_response
        end
      else
        env['action_dispatch.show_exceptions'] = true
        @app.call(env)
      end
    end
  end

  module Exceptions
    class Base < StandardError
      def to_rack_response
        [status_code, headers, [body]]
      end

      private

      def status_code
        500
      end

      def headers
        { "Content-Type" => "application/json" }
      end

      def body
        { message: error_message}.to_json
      end

      def error_message
        "エラーが発生しました"
      end
    end

    class InternalServerError < Base
    end
  end
end
