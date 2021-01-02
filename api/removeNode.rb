require_relative '../classes/Node'

delete '/remove_node' do
  body = JSON.parse(request.body.read)
  hostname = body["node"]
  node = Node.new(hostname)
  node.remove_from_cluster
end
