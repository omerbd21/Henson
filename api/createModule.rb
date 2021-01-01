require_relative '../classes/Module'

put '/apply_module' do
  push = JSON.parse(request.body.read)
  path = push["path"]
  nodes = push["nodes"]
  new_module = Module.new(path, nodes)
  new_module.move
end
