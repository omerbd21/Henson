require_relative '../classes/Node'

post '/add_node' do
  body = JSON.parse(request.body.read)
  hostname = body["node"]
  node = Node.new(hostname)
  node.add_to_cluster
end
