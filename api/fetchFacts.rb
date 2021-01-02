require_relative '../classes/Node'

get '/fetch_facts/:hostname' do
  hostname = params[:hostname]
  node = Node.new(hostname)
  node.get_facts
end
