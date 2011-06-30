.PHONY: help dev mac apt_update mac_apt_install update_alt apt_clean gemrc gems buildr sun_java6

# bootstrap to get ruby and gem
help:; @echo "make dev: install packages needed for development on ubuntu\nmake mac: install packages needed for development on a mac"

dev: apt_update apt_install update_alt apt_clean gemrc sun_java6

apt_update:; @sudo apt-get update

PKGS=build-essentials ksh m4 libprotoc6 ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 xxdiff
apt_install:; @for i in ${PKGS}; do sudo apt-get install -y $$i; done

update_alt:
	@sudo update-alternatives \
		--install /usr/bin/ruby ruby /usr/bin/ruby1.8 500 \
		--slave /usr/share/man/man1/ruby.1.gz ruby.1.gz /usr/share/man/man1/ruby.1.8.gz \
		--slave /usr/bin/irb irb /usr/bin/irb1.8

apt_clean:
	@sudo apt-get autoremove
	@sudo apt-get autoclean

gemrc:;	echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc

GEMS=rake smart_colored
gems:
	@for i in ${GEMS}; do \
		gem=$$(echo $$i|sed 's/:/ -v /1'); \
		if !gem list -i $$gem >/dev/null 2>&1; then sudo gem install --no-ri --no-rdoc $$gem; fi \
	done

buildr:
	@if !gem list -i $@ >/dev/null 2>&1; then \
	    if [ -z "${JAVA_HOME}" ]; then \
	        sudo env JAVA_HOME=/usr/lib/jvm/java-6-sun gem install --no-ri --no-rdoc $@; \
	    else \
	        sudo gem install --no-ri --no-rdoc $@; \
	    fi; \
	fi

sun_java6:
	sudo apt-get install -y sun-java6-bin sun-java6-jdk sun-java6-jre sun-java6-fonts
	sudo update-java-alternatives --set java-6-sun || exit 0
