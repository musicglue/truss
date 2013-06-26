class HomeEndpoint < Truss::Endpoint
    def action
        status 200
        content_type :text
        "Hello World"
    end
end
