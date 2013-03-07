# use launcher from Frank gem
require 'sim_launcher'

SimLauncher::DirectClient.new("#{Dir.pwd}/test.app", nil, "6.1").relaunch