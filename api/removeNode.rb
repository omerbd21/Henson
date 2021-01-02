require_relative '../classes/Node'

delete '/remove_node' do
  push = JSON.parse(request.body.read)
  hostname = push["node"]
  node = Node.new(hostname)
  node.remove_from_cluster
end
