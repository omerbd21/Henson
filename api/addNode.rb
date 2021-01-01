require_relative '../classes/Node'

post '/add_node' do
  push = JSON.parse(request.body.read)
  hostname = push["node"]
  node = Node.new(hostname)
  node.add_to_cluster
end
