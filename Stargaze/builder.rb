begin
  start_time = Time.now
  Dir.chdir(Dir.pwd) do
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

    frameworks.each do |framework|
      final_query << " -framework #{framework}"
    end
    final_query << " -o test "
    final_query << compiled_objects.join(' ')
    # execute
    `#{final_query}
    mkdir -p test.app
    cp Info.plist test.app/
    touch test.app/PkgInfo
    cp test test.app/`
  end
  puts "Build done in #{Time.now - start_time}s."
rescue => e
  raise "BUILDER ERROR:" + e.to_s
end