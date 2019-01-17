# List of actual XML files, not symlinks pointing to them
XML := $(shell find . -maxdepth 1 -type f -name '*.xml' -printf '%f\n')
CRUFT := $(shell find . -xtype l -printf '%f\n')

.PHONY: all $(XML)

# Default target all XML files
all: $(XML) $(CRUFT)

# Clean up left-over symlinks
$(CRUFT):
	@rm -f $@

# Foreach XML file do
$(XML):
	@# Make sure file is world-readable
	@chmod 0644 $@
	
	@# Set variable with entityID from within XML file
	$(eval ENTITY = $(shell xmllint --format $@ | fgrep entityID | sed -r 's/.*entityID="(.+)".*/\1/'))
	
	@# Set variable with SHA1 hash of entityID value
	$(eval HASH = $(shell echo -n $(ENTITY)| openssl sha1 -r | cut -d' ' -f1))
	
	@# Create symlink to XML file named after SHA1 hash of the entityID in the XML, if it doesn't exist
	@test -L $(HASH).xml || ln -sf $@ $(HASH).xml
