PATH:=./node_modules/.bin/:$(PATH)

all: install build test start

clean:
	rm -rf lib/*

init:
	if [ -e npm-shrinkwrap.json ]; then rm npm-shrinkwrap.json; fi
	npm install

build: clean init
	./node_modules/.bin/coffee -cm -o lib src

watch: end-watch
	./node_modules/.bin/coffee -cmw -o lib src          & echo $$! > .watch_pid

end-watch:
	if [ -e .watch_pid ]; then kill `cat .watch_pid`; rm .watch_pid;  else  echo no .watch_pid file; fi

test:
	npm test

docs:
	echo "Error: no docs generator installed"
	# ./node_modules/.bin/groc "src/*.coffee?(.md)" "src/**/*.coffee?(.md)" readme.md

clean-docs:
	rm -rf docs/*
