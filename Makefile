# Paths
NODE_MODULES = node_modules
PACKAGE_JSON = package.json
PACKAGE_LOCK = package-lock.json

# Commands
NPM = npm
ELEVENTY = $(NODE_MODULES)/.bin/eleventy

# Default target
.DEFAULT_GOAL := serve

# Install dependencies if node_modules doesn't exist or package.json/package-lock.json has changed
$(NODE_MODULES): $(PACKAGE_JSON) $(PACKAGE_LOCK)
	@echo "Installing dependencies..."
	$(NPM) install

# Reinstall dependencies if package.json or package-lock.json changes
install: $(NODE_MODULES)

# Clean installed dependencies
clean:
	@echo "Cleaning node_modules..."
	rm -rf $(NODE_MODULES)

# Build the site
build: install
	@echo "Building the site with 11ty..."
	$(ELEVENTY)

# Serve the site locally
serve: install
	@echo "Starting 11ty development server..."
	$(ELEVENTY) --serve

# Force reinstall (clean and install)
reinstall: clean install

public/icon/favicon.ico: content/btrblocks.svg
	convert -density 300 -define icon:auto-resize=256,128,96,64,48,32,16 \
			-background none $< $@

favicon: public/icon/favicon.ico

# Phony targets
.PHONY: install clean build serve reinstall favicon
