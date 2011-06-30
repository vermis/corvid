COR_HOME = File.expand_path(File.dirname(__FILE__))
Dir.glob("#{COR_HOME}/lib/rake/*.rake").each { |r| import r }

task :default do; sh "rake -T"; end

desc "make a distribution for QA"
task :qa => :build do; sh "cd etc && rake clean qa"; end
task :staging => :qa

desc "make a distribution for PROD"
task :prod => :build do; sh "cd etc && rake clean prod"; end
