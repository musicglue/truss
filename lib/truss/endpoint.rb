module Truss
    class Endpoint
        attr_accessor :env, :request
        
        def initialize(env)
            @env, @status, @body = env, nil, nil
            @request = Truss::Router::Request.new(env) unless env.is_a?(Truss::Router::Request) 
            @headers = {'Content-Type' => 'text/html; charset=utf-8'}
        end

        def self.call(env)
            new(env).call
        end

        def action
            raise NotImplementedError
        end
    
        def content_type(type)
            header 'Content-Type' => case type
                                     when :json
                                        'application/json; charset=utf-8'
                                     when :xml
                                        'application/xml; charset=utf-8'
                                     when :html
                                        'text/html; charset=utf-8'
                                     when :text
                                        'text/plain; charset=utf-8'
                                     else
                                        type
                                     end
        end
    
        def header(header={})
            @headers.merge!(header)
        end

        def not_found
            status :not_found
            content_type :text
            ""
        end

        def status(code)
            @status =   if code.is_a?(Integer)
                            code
                        else
                            case code
                            when :ok
                                200
                            when :accepted
                                202
                            when :not_authorized
                                401
                            when :not_found
                                404
                            when :error
                                500
                            end
                        end
        end

        def call
            [
                @status,
                @headers,
                [action].flatten
            ]
        end
    end
end
