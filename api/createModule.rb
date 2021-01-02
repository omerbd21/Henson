require_relative '../classes/Module'

put '/apply_module' do
  body = JSON.parse(request.body.read)
  path = body["path"]
  nodes = body["nodes"]
  new_module = Module.new(path, nodes)
  new_module.move
end
