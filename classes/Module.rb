# create and run a Puppet module on all of our nodes
require 'rbconfig'
require_relative 'sshCommand'
class Module
  def initialize(path, nodes)
    @path = path
    @nodes = nodes
  end
  def move
    is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
    if is_windows
    filename = @path.split('\\')
    else
      filename = @path.split('/')
    end
    %x( scp #{@path} root@puppetserver:/etc/puppetlabs/code/environments/production/manifests/#{filename[-1]} )
    @nodes.each { |node|
      SshCommand.new("puppet agent -t",node).run
    }
  end
end
