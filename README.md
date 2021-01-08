# Henson
Henson is a REST API to control a Puppet cluster.
## What does it do?
The API can add or remove a node from a Puppet cluster, get facts, apply a module or get all  
the nodes in the cluster.
## How does it work?
The API was written in Ruby with the Sinatra framework.
## Requirements
1. Your puppetserver hostname must be puppetserver (and accessible for SSH over that hostname  
e.g. ssh puppetserver should work)
2. All of your nodes must be accessible for SSH over their hostnames as well.
3. All of your nodes & master must be available for passwordless SSH
## Notes
This is part of a bigger project, which is why it is currently only an API without a UI.  
Later on, it will be integrated with multiple APIs to create a web application.

**Omer Ben David, January 2021**
