class HomeEndpoint < Truss::Endpoint
  def action
    status :ok
    content_type :text
    "Hello World"
  end
end
