RELEASABLE=true
APP_NAME:=rabbitmq_lager

UPSTREAM_GIT:=http://github.com/basho/lager.git
## revision is pinned at 2.0.0rc1
UPSTREAM_REVISION:=9719370eeaf8b64c1c3e79fb7052cb1ca29f16c8
RETAIN_ORIGINAL_VERSION:=true

ORIGINAL_APP_FILE:=$(CLONE_DIR)/src/lager.app.src
DO_NOT_GENERATE_APP_FILE=true

define package_rules

# This rule is run *before* the one in do_package.mk
$(PLUGINS_SRC_DIST_DIR)/$(PACKAGE_DIR)/.srcdist_done::
	cp $(CLONE_DIR)/LICENSE $(PACKAGE_DIR)/LICENSE-Apache-Basho-Lager

$(CLONE_DIR)/src/$(APP_NAME).app.src: $(CLONE_DIR)/.done

endef
