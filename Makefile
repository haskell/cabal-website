# The .cabal-archive likely has at least one test with an intentionally broken
# symlink. Rather than having Hakyll ignore all the files in .cabal-archive/**,
# we delete all but the README.md file, keeping the makefile recipes simple and
# avoiding having to configure Hakyll to ignore the broken symlink.

# $ cabal run site -- watch
# Listening on http://127.0.0.1:8000
# Initialising...
#   Creating store...
#   Creating provider...
#   Running rules...
# Checking for out-of-date items
# Compiling
#   Using async runtime with 1 threads...
# Success
# site: /.../cabal-website/.cabal-archive/cabal-<sha>/cabal-install/tests/fixtures/project-root/cabal.project.symlink.broken:
# getFileStatus: does not exist (No such file or directory)

CABAL_VERSION ?= b1e842d22b2d3fcd973b77bb81cf109f503be5f2
CABAL_URL := https://github.com/haskell/cabal/archive/${CABAL_VERSION}.tar.gz

all: .cabal-archive/cabal-${CABAL_VERSION}/README.md

.cabal-archive/cabal-${CABAL_VERSION}/README.md:
	rm -rf release-notes
	curl -sSL ${CABAL_URL} | tar -xz
	rm -rf .cabal-archive/cabal-$(CABAL_VERSION)
	mkdir -p .cabal-archive/cabal-${CABAL_VERSION}
	mv cabal-*/release-notes -T release-notes
	cp cabal-$(CABAL_VERSION)/$(@F) $@
	rm -rf cabal-$(CABAL_VERSION)
