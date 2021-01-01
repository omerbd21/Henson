# Get an update from our module (basically just puppet agent -t)
# add a node to our Puppet Cluster
require_relative 'sshCommand'
class Node
  def initialize(hostname)
    @hostname = hostname
  end
  def add_to_cluster
    # The hostname of the puppet server must be puppetserver
    run_command = SshCommand.new("yum install -y puppet-agent", @hostname)
    run_command.run
    run_command.command("echo \"export PATH=/opt/puppetlabs/bin/;$PATH\"  >> /etc/profile")
    run_command.run
    run_command.command("puppet config set server puppetserver --section main")
    run_command.run
    run_command.command("puppet agent -t")
    run_command.run
    SshCommand.new("puppetserver ca sign --all", "puppetserver").run
  end
end
