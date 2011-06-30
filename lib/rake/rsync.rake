namespace :push do
    desc "push app to PROD"
    task :prod do
    end

    desc "push app to QA"
    task :qa do
    end

    TOMCAT_HOME = "#{COR_HOME}/opt/tomcat"

    desc "push app to [hostname/IP], e.g.: \"rake qa\" followed by \"rake push[<IP>]\""
    task :dist, :ip, :yes? do |t, args|
        sh "#{ESSH} #{args[:ip]} 'sudo mkdir -p /mnt/dist && sudo chown -R ubuntu /mnt/dist'"
        rsync(TOMCAT_HOME, "#{args[:ip]}:/mnt/dist/", :noop => args[:yes?] == "[Yy]{1,1}[Ee]{1,1}[Ss]{1,1}")
        sh "#{ESSH} #{args[:ip]} 'sudo rsync -ax --delete /mnt/dist/tomcat/ /opt/tomcat/'"
    end

    RSYNC = "rsync -axv --copy-links --delete --delete-excluded --exclude '.git' --exclude '.gitignore' --exclude '*.scala' --exclude '*.java' --exclude '*.c' --exclude '*.cc' --exclude '*.m' --exclude '*.h'--exclude '*.m4' --exclude 'Rakefile' --exclude 'Makefile' --exclude 'logs/*' --exclude 'temp/*' --exclude 'work/*' --exclude '*.~*~' --exclude '#*'"

    def rsync(src, dst, opt ={:noop => true})
        if opt[:noop]
            puts "NOOP".red
            sh "#{RSYNC} --dry-run --rsh=#{ESSH} '#{src}' '#{dst}'"
        else
            sh "#{RSYNC} --rsh=#{ESSH} '#{src}' '#{dst}'"
        end
    end
end
