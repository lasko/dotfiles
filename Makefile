update: 
	git submodule foreach git pull

install: install-externals 

install-externals:
	git submodule update --init
