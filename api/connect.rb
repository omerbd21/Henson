require_relative '../classes/sshCommand'
post '/connect' do
  push = JSON.parse(request.body.read)
  ip = push["ip"]
  command = push["command"]
  runCommand = SshCommand.new(command, ip)
  result = runCommand.run
  if result.is_a?(Net::SSH::ConnectionTimeout.class)
    status 405
    body "You didn't enter this production server's public SSH key to the puppet server's authorized_keys.\n
      That is, only if you entered the correct IP"
  elsif result.include?("command not found")
    status 405
    body "That is not a Puppet server."
  else
    result.split("\n")[2..]
  end

end
