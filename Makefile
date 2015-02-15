all:
	mkdir -p build/example/
	coffee -c --output build/ src/
	coffee -c --output build/example/ example/