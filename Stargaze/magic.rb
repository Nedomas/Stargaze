require 'net/ssh'

macbox = !File.exist?('config.personal')
begin
  require 'sim_launcher' # from Frank gem
rescue
  raise if macbox
end

$app_dir = ""
$project_dir_in_box = "/Users/mac/Workspace/Stargaze"

if macbox
  # in box
  $ip = $user = $port = 0
  $app_dir = "/Users/mac/Workspace/Stargaze/Stargaze"
else
  # in local
  load 'config.personal' # load ip
  $app_dir = Dir.pwd
end

# local side methods
class Local
  class << self
    def sync
      puts "Started syncing..."
      `rsync -rtvuq --progress --rsh="ssh -p#{$port}" ../../Stargaze/ #{$user}@#{$ip}:#{$project_dir_in_box}/`
      puts "Syncing done!"
    end
  end
end

# box side methods
class Box
  class << self

    def launch
      SimLauncher::DirectClient.new("#{$app_dir}/test.app", nil, "6.1").relaunch
    end

    def clean
      `rm -r $project_dir_in_box`
    end

    def build
      Dir.chdir($app_dir) do
        base_object_query = "Clang -arch i386 -Wno-import -Werror -fobjc-abi-version=2 -fobjc-legacy-dispatch -D__IPHONE_OS_VERSION_MIN_REQUIRED=50000 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.1.sdk -c -o"

         # find all implementation files and compile
        objects = `ls | grep \[.]m$`.split("\n")
        compiled_objects = []
        frameworks = []
        objects.each do |object|
          without_extension = object.match(/[a-zA-Z]*/)
          custom_object_query = " #{without_extension}.o #{object}"
          build_query = base_object_query + custom_object_query
          `#{build_query}`
          compiled_objects << "#{without_extension}.o"
        end

        files = objects + `ls | grep \[.]h$`.split("\n")
        files.each do |file|
          # read frameworks
          File.open(file, "r") do |infile|
            while (line = infile.gets)
              line_match = line.match(/[a-zA-Z]*.h>/).to_s[0..-4]
              frameworks << line_match unless line_match.empty?
            end
          end
        end

        # make app
        final_query = "Clang -arch i386 -Wno-import -Werror -fobjc-abi-version=2 -fobjc-legacy-dispatch -D__IPHONE_OS_VERSION_MIN_REQUIRED=50000 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.1.sdk -Xlinker -objc_abi_version -Xlinker 2 -lobjc"

        final_query << " -o test "

        frameworks.uniq.each do |framework|
          final_query << "-framework #{framework} "
        end
    
        final_query << compiled_objects.join(' ')
        # execute
        %x[#{final_query}
        mkdir -p test.app
        cp Info.plist test.app/
        touch test.app/PkgInfo
        cp test test.app/]
      end
    end

  end
end

case ARGV[0]
when 'ping'
  puts "Trying to connect to #{$user}@#{$ip}:#{$port}"
  Net::SSH.start($ip, $user, :port => $port) do |ssh|
    puts "SSH connection works!"
    puts "SSH into the box with: ssh #{$user}@#{$ip} -p #{$port}"
  end
when 'sync'
  Local.sync
when 'sync_build_launch'
  Local.sync
  Net::SSH.start($ip, $user, :port => $port) do |ssh|
    puts 'Started building...'
    ssh.exec!("ruby #{$project_dir_in_box}/Stargaze/magic.rb box build")
    puts 'Built.'
    puts 'Started launching...'
    ssh.exec!("ruby #{$project_dir_in_box}/Stargaze/magic.rb box launch")
    puts 'Launched.'
  end
when 'clean'
  # currently does not work
  p 'Cleaning your mess...'
  Net::SSH.start($ip, $user, :port => $port) do |ssh|
    puts ssh.exec!("ruby #{$project_dir_in_box}/Stargaze/magic.rb box clean_macbox")
    puts 'Done.'
  end
when 'log'
  puts 'Just use: bash magic log'
  # %x[bash old_magic log]
  # %x[ssh -t -t #{$user}@#{$ip} -p #{$port} 'tail -f /var/log/system.log | grep test']
when 'box'
  case ARGV[1]
  when 'launch' then Box.launch
  when 'build' then Box.build
  when 'clean_macbox' then Box.clean
  end
end