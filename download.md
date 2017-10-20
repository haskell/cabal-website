---
title: Getting The Haskell Cabal
---

**Note:** Most people already have Cabal because it is included in the [Haskell Platform](http://www.haskell.org/platform/)

If you want to upgrade to the latest stable version, just run:

    $ cabal install cabal cabal-install

Sometimes the older installed version is still on the program search $PATH, you can check you're running the latest version with:

    $ cabal --version

## Cabal library (version 2.0.0.2)
August 2017: Release 2.0.0.2

Source download: [Cabal-2.0.0.2.tar.gz](release/cabal-2.0.0.2/Cabal-2.0.0.2.tar.gz)

Please see the [User's guide](release/cabal-2.0.0.2/doc/users-guide/), the [API documentation](release/cabal-2.0.0.2/doc/API/Cabal/), and the [change log](release/cabal-2.0.0.2/changelog).

## cabal-install tool (version 2.0.0.0)
cabal-install is the command line interface to Cabal and hackage.
This is the package that provides the 'cabal' command line program.

Source download: [cabal-install-2.0.0.0.tar.gz](release/cabal-install-2.0.0.0/cabal-install-2.0.0.0.tar.gz)

### Binary downloads

* Windows (x86): [cabal-install-2.0.0.0-i386-unknown-mingw32.zip](release/cabal-install-2.0.0.0/cabal-install-2.0.0.0-i386-unknown-mingw32.zip)
* Windows (x86-64): [cabal-install-2.0.0.0-x86_64-unknown-mingw32.zip](release/cabal-install-2.0.0.0/cabal-install-2.0.0.0-x86_64-unknown-mingw32.zip)
* macOS Sierra (x86_64): [cabal-install-2.0.0.0-x86_64-apple-darwin-sierra.tar.xz](release/cabal-install-2.0.0.0/cabal-install-2.0.0.0-x86_64-apple-darwin-sierra.tar.xz)
* Linux (x86): [cabal-install-2.0.0.0-i386-unknown-linux.tar.gz](release/cabal-install-2.0.0.0/cabal-install-2.0.0.0-i386-unknown-linux.tar.gz)
* Linux (x86-64): [cabal-install-2.0.0.0-x86_64-unknown-linux.tar.gz](release/cabal-install-2.0.0.0/cabal-install-2.0.0.0-x86_64-unknown-linux.tar.gz)
* AIX (PowerPC): [cabal-1.24.0.0-powerpc-ibm-aix7.1.0.0.xz](release/cabal-install-1.24.0.0/cabal-1.24.0.0-powerpc-ibm-aix7.1.0.0.xz)

Binaries for cabal-install for many platforms are available on [Halcyon](https://halcyon.sh/).

Packages for Ubuntu Linux (multiple versions) are available on [hvr's PPA](https://launchpad.net/~hvr/+archive/ubuntu/ghc).

The source package requires the Cabal package above and also further packages,
which can be found on Hackage. To make the process easier the cabal-install
tarball contains a bootstrap.sh script which downloads and installs all the
dependencies.

## Bugs
Report bugs [here](https://github.com/haskell/cabal/issues) or to the [cabal-devel](mailto:cabal-devel@haskell.org)  mailing list.

## Code
You can get the development version of the code [here](code.html).

## Version Numbers
Stable Releases are numbered a.b.c.d, where b is even. Unstable snapshots between releases are numbered a.b.c.d, where b is odd. Changes for c and d are minor.

For example, 2.1.x.x is the development version leading up to the stable release 2.2.x.x.

## Older Releases

* The previous stable release series for Cabal was 1.24.x.
* The previous stable release series for cabal-install was 1.24.x.

The versions bundled with recent Haskell implementation releases include:

* GHC 8.2.1 includes Cabal 2.0.0.2.
* GHC 8.0.2 includes Cabal 1.24.2.0.
* GHC 8.0.1 includes Cabal 1.24.0.0.
* GHC 7.10.3 includes Cabal 1.22.5.0.

<!-- GHC 7.8.4 includes Cabal 1.18.1.5. -->
<!-- GHC 7.8.1 includes Cabal 1.18.1.3. -->
<!-- GHC 7.4.1 includes Cabal 1.14.0. -->
<!-- GHC 7.2.2 includes Cabal 1.12.0. -->
<!-- GHC 7.0.4 includes Cabal 1.10.2.0. -->
<!-- GHC 6.12.3 includes Cabal 1.8.0.6. -->
<!-- GHC 6.10.4 includes Cabal 1.6.0.3. -->
<!-- GHC 6.8.3 includes Cabal 1.2.4.0. -->
<!-- GHC 6.6.1 includes Cabal 1.1.6.2. -->
<!-- Hugs98 September 2006 includes Cabal 1.1.5.9.2 (the 2nd release candidate for 1.1.6). -->
<!-- nhc98 1.20 includes Cabal-1.2.2.0. -->


* [2.0.0.2](release/cabal-2.0.0.2/Cabal-2.0.0.2.tar.gz) August 2017
* [1.24.2.0](release/cabal-1.24.2.0/Cabal-1.24.2.0.tar.gz) December 2016
* [1.24.1.0](release/cabal-1.24.1.0/Cabal-1.24.1.0.tar.gz) October 2016
* [1.24.0.0](release/cabal-1.24.0.0/Cabal-1.24.0.0.tar.gz) May 2016
* [1.22.8.0](release/cabal-1.22.8.0/Cabal-1.22.8.0.tar.gz) March 2016
* [1.22.7.0](release/cabal-1.22.7.0/Cabal-1.22.7.0.tar.gz) January 2016
* [1.20.0.4](release/cabal-1.20.0.4/Cabal-1.20.0.4.tar.gz) January 2016
* [1.18.1.7](release/cabal-1.18.1.7/Cabal-1.18.1.7.tar.gz) January 2016
* [1.22.6.0](release/cabal-1.22.6.0/Cabal-1.22.6.0.tar.gz) December 2015
* [1.22.4.0](release/cabal-1.22.4.0/Cabal-1.22.4.0.tar.gz) June 2015
* [1.22.3.0](release/cabal-1.22.3.0/Cabal-1.22.3.0.tar.gz) April 2015
* [1.22.2.0](release/cabal-1.22.2.0/Cabal-1.22.2.0.tar.gz) March 2015
* [1.22.0.0](release/cabal-1.22.0.0/Cabal-1.22.0.0.tar.gz) January 2015
* [1.18.1.6](release/cabal-1.18.1.6/Cabal-1.18.1.6.tar.gz) January 2015
* [1.20.0.3](release/cabal-1.20.0.3/Cabal-1.20.0.3.tar.gz) December 2014
* [1.18.1.5](release/cabal-1.18.1.5/Cabal-1.18.1.5.tar.gz) December 2014
* [1.20.0.2](release/cabal-1.20.0.2/Cabal-1.20.0.2.tar.gz) July 2014
* [1.18.1.4](release/cabal-1.18.1.4/Cabal-1.18.1.4.tar.gz) July 2014
* [1.20.0.1](release/cabal-1.20.0.1/Cabal-1.20.0.1.tar.gz) May 2014
* [1.20.0.0](release/cabal-1.20.0.0/Cabal-1.20.0.0.tar.gz) April 2014
* [1.18.1.3](release/cabal-1.18.1.3/Cabal-1.18.1.3.tar.gz) March 2014
* [1.18.1.2](release/cabal-1.18.1.2/Cabal-1.18.1.2.tar.gz) October 2013
* [1.18.1.1](release/cabal-1.18.1.1/Cabal-1.18.1.1.tar.gz) October 2013
* [1.18.1](release/cabal-1.18.1/Cabal-1.18.1.tar.gz) September 2013
* [1.18.0](release/cabal-1.18.0/Cabal-1.18.0.tar.gz) September 2013
* [1.14.0](release/cabal-1.14.0/Cabal-1.14.0.tar.gz) February 2012
* [1.12.0](release/cabal-1.12.0/Cabal-1.12.0.tar.gz) January 2012
* [1.10.2.0](release/cabal-1.10.2.0/Cabal-1.10.2.0.tar.gz) June 2010
* [1.10.1.0](release/cabal-1.10.1.0/Cabal-1.10.1.0.tar.gz) February 2010
* [1.10.0.0](release/cabal-1.10.0.0/Cabal-1.10.0.0.tar.gz) November 2010
* [1.8.0.6](release/cabal-1.8.0.6/Cabal-1.8.0.6.tar.gz) June 2010
* [1.8.0.4](release/cabal-1.8.0.4/Cabal-1.8.0.4.tar.gz) March 2010
* [1.8.0.2](release/cabal-1.8.0.2/Cabal-1.8.0.2.tar.gz) December 2009
* [1.6.0.2](release/cabal-1.6.0.2/Cabal-1.6.0.2.tar.gz) February 2009
* [1.6.0.2](release/cabal-1.6.0.2/Cabal-1.6.0.2.tar.gz) February 2009
* [1.6.0.1](release/cabal-1.6.0.1/Cabal-1.6.0.1.tar.gz) October 2008
* [1.4.0.2](release/cabal-1.4.0.2/Cabal-1.4.0.2.tar.gz) August 2008
* [1.4.0.1](release/cabal-1.4.0.1/Cabal-1.4.0.1.tar.gz) June 2008
* [1.2.3.0](release/cabal-1.2.3.0/cabal-1.2.3.0.tar.gz) December 2007
* [1.2.2.0](release/cabal-1.2.2.0/cabal-1.2.2.0.tar.gz) October 2007
* [1.2.1.0](release/cabal-1.2.1.0/cabal-1.2.1.0.tar.gz) October 2007
* [1.2.0](release/cabal-1.1.6.2/cabal-1.1.6.2.tar.gz) September 2007
* [1.1.6.2](release/cabal-1.1.6.2/cabal-1.1.6.2.tar.gz) May 2007
* [1.1.6.1](release/cabal-1.1.6.1/cabal-1.1.6.1.tar.gz) October 2006
* [1.1.6](release/cabal-1.1.6/cabal-1.1.6.tar.gz) October 2006
* [1.1.4](release/cabal-1.1.4/cabal-1.1.4.tar.gz) May 2006
* [1.1.3](release/cabal-1.1.3/cabal-1.1.3.tar.gz) September 2005
* [1.1.1](release/old/cabal-1.1.1/cabal-1.1.1.tar.gz) July 2005
* [0.5](release/old/cabal-0.5.tgz) February 2005
* [0.4](release/old/cabal-0.4.tgz) January 2005
* [0.2](release/old/cabal-0.2.tgz) November 2004
* [0.1](release/old/cabal-0.1.tgz) August 2004
