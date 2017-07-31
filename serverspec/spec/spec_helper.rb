require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

set :backend, :ssh # v2から
set :path, '/sbin:/usr/sbin:$PATH' # v2から

RSpec.configure do |c|
  c.before :all do
    set :host, ENV['TARGET_HOST']
    options = Net::SSH::Config.for(c.host)
    options[:user] = ENV['SSH_USER']
    #options[:password] = ENV['SSH_PASSWORD']
    options[:keys] = ENV['SSH_PRIVATE_KEY']
    set :ssh_options, options # v2から
  end
end

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
