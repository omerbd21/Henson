require_relative 'sshCommand'
class Node
  def initialize(hostname)
    @hostname = hostname
    @facts = ""
  end
  def add_to_cluster
    # The hostname of the puppet server must be puppetserver
    run_command = SshCommand.new("yum install -y puppet-agent", @hostname).run
    run_command.command("echo \"export PATH=/opt/puppetlabs/bin/:$PATH\"  >> /etc/profile").run
    run_command.command("puppet config set server puppetserver --section main").run
    run_command.command("puppet agent -t").run
    SshCommand.new("puppetserver ca sign --all", "puppetserver").run
  end
  def remove_from_cluster
    SshCommand.new("puppet node clean #{@hostname}", "puppetserver").run
    SshCommand.new("yum remove -y puppet-agent", @hostname).run
    SshCommand.new("rm -rf /opt/puppetlabs", @hostname).run
  end
  def get_facts
    @facts = SshCommand.new("facter", @hostname).run
  end
end
