require 'sinatra'
require 'net/ssh'
require_relative 'api/get_nodes'
require_relative 'api/addNode'
require_relative 'api/createModule'
require_relative 'api/removeNode'
require_relative 'api/fetchFacts'
set :bind, '0.0.0.0'
set :port, 4000