#!/Users/xchewmer/.rvm/rubies/ruby-3.0.6/bin/ruby

def watchmandel
  cmd = `watchman watch-del-all`
  puts cmd
end

def delpackagercache
  cmd = `rm -rf $TMPDIR/react-native-packager-cache-*`
  puts cmd
end

def delmetrobundlercache
  cmd = `rm -rf $TMPDIR/metro-bundler-cache-*`
  puts cmd
end

def delnodemodules
  Dir.chdir(options[:path]) {
    cmd = `rm -rf node_modules/`
    puts cmd
  }
end

def yarncachecleaninstall
  Dir.chdir(options[:path]) {
    cmd = `yarn cache clean`
    puts cmd
    cmd2 = `yarn`
    puts cmd2 
  }
end

def main
  options = {:path => `pwd`}
  begin
    watchmandel
    delpackagercache    
    delmetrobundlercache
    yarncachecleaninstall
  rescue
    puts "[-] error happend at main"
  end
  puts options[:path]
end

main

