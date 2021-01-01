class SshCommand
  def initialize(command, ip)
    @command = command
    @ip = ip
    @result = ""
  end
  def run
    begin
      Net::SSH.start(@ip, 'root', :number_of_password_prompts => 0) do |ssh|
        command = @command
        output = ssh.exec!(command)
        @result = output
      end
    rescue Net::SSH::ConnectionTimeout, Net::SSH::AuthenticationFailed
      @result = Net::SSH::ConnectionTimeout
      end
    end
  def result
    @result
  end
end
