---
title: Cabal
---

Introduction
============

Cabal is an acronym of **C**ommon **A**rchitecture for **B**uilding
**A**pplications and **L**ibraries. Central to this architecture is ``cabal``, the
executable (exe) build tool from the `cabal-install <cabal-install-pkg_>`_ package.

.. tip::

    This is a tip

.. info::

    This is information

.. note::

    This is a note

.. warning::

    This is a warning

.. success::

    This is success

.. danger::

    This is danger

.. info::

    This architecture defines a common interface for package authors and
    distributors to easily build their applications in a portable way. It is
    part of a larger infrastructure for distributing, organizing, and cataloging
    Haskell libraries and programs.  Specifically, it describes what a package
    is, how these interact with the language, and what Haskell implementations
    (compilers) must to do to support packages. It also specifies some
    infrastructure (code) that makes it easy for tool authors to build and
    distribute conforming packages.

Here's an elided dump of `cabal --help` showing the fundamental commands:

.. code-block:: shell
    $ cabal --help
    Command line interface to the Haskell Cabal infrastructure.

    Commands:
    [initialization and download]
      init                   Create a new cabal package.

    [project building and installing]
      build                  Compile targets within the project.
      clean                  Clean the package store and remove temporary files.

    [running and testing]
      repl                   Open an interactive session for the given component.
      run                    Run an executable.
      test                   Run test-suites.

    [sanity checks and shipping]
      sdist                  Generate a source distribution file (.tar.gz).

.. warning::
    The architecture says nothing about more global issues such as how authors
    decide where in the module name space their library should live; how users
    can find a package they want; how orphan packages find new owners; and so
    on.

Packages
========

When developing anything non-trivial in Haskell, anything that larger than a
single ``.hs`` file, we pack modules (``.hs`` files) into packages.

- **Module** - The unit of compilation in Haskell is the module. A module is a
  collection of related functions, types, and type classes. Modules are the
  primary unit of organization in Haskell programs.
- **Package** - The unit of distribution in Haskell is the package. A package is
  a collection of one or more modules, plus some metadata about the package
  (e.g., its name, version, and dependencies). Package components include
  libraries, executables, test suites and benchmarks.

Package source code can be published to Hackage and vetted by Stackage.

- **Hackage** - A central repository of Haskell packages. Hackage is a website
  that hosts packages and provides tools for searching, browsing, and
  downloading packages.
- **Stackage** - For each resolver Stackage pairs a GHC compiler version with a
  groups of packages from Hackage that build together. This group is pins each
  included package to an exact version.

  Stackage resolvers come in three sets; ``nightly-yyyy-mm-dd`` for the latest
  set, ``lts-mm.nn`` for stable packages and ``ghc`` for the very limited set of
  packages released with GHC. Each ``lts-mm.*`` series imposes some rules on
  included packages, such as not allowing breaking version bumps.

Demo
====

Having installed ``GHC`` and ``cabal`` with `GHCup <ghcup_>`_ on Ubuntu Linux, let's
find ``cabal``;

.. code-block:: shell

    $ type cabal
    cabal is ~/.ghcup/bin/cabal

    $ readlink ~/.ghcup/bin/cabal
    cabal-3.10.3.0

    $ type cabal-3.10.3.0
    cabal-3.10.3.0 is ~/.ghcup/bin/cabal-3.10.3.0

We can use ``cabal`` to download its own package, ``cabal-install``, from Hackage.

.. info::

    A package is its description, in a ``.cabal`` file, and all of the source
    referred to by that description. The package description file name must be
    the same as the name of the package. An ``sdist`` is a ``.tar.gz`` archive
    of a package.

.. code-block:: shell

    $ VER=3.10.3.0 cabal get cabal-install-{$VER}
    Downloading  cabal-install-3.10.3.0
    Downloaded   cabal-install-3.10.3.0
    Unpacking to cabal-install-3.10.3.0/

    $ VER=3.10.3.0 cat cabal-install-{$VER}/cabal-install.cabal
    Cabal-Version:      2.2
    Name:               cabal-install
    Version:            3.10.3.0
    ...
    executable cabal
    ...

We can install ``cabal`` it again[#]_, showing that ``cabal`` can build and install
local packages from source and when doing so downloads dependencies from
Hackage, in this case ``cabal-install-solver`` and ``hackage-security``.

.. info::

    We can (and oftentimes must) use `targets <target-forms_>`_ to specify some or all
    of the components of a package.  Many ``cabal`` build tool commands require a
    target and in fact, ``cabal build`` will fail if not given a target.

    - The ``all`` target includes every component.
    - The ``all:ctype`` target includes every component of a certain component type
      (``ctype``), such as ``libs``, ``exes`` and ``tests``.
    - ``cabal-install:exe:cabal`` is a fully qualified name for ``cabal``, as an ``exe``
      component of the ``cabal-install`` package.

.. code-block:: shell

    $ cd cabal-install-3.10.3.0/

    $ cabal install cabal-install:exe:cabal --overwrite-policy=always
    Wrote tarball sdist to
    /.../cabal-install-3.10.3.0/dist-newstyle/sdist/cabal-install-3.10.3.0.tar.gz
    Resolving dependencies...
    Build profile: -w ghc-9.8.2 -O1
    In order, the following will be built (use -v for more details):
    - cabal-install-solver-3.10.3.0 (lib) (requires download & build)
    - hackage-security-0.6.2.6 (lib) (requires build)
    - cabal-install-3.10.3.0 (lib) (requires build)
    - cabal-install-3.10.3.0 (exe:cabal) (requires build)
    Downloading  cabal-install-solver-3.10.3.0
    Starting     hackage-security-0.6.2.6 (lib)
    Downloaded   cabal-install-solver-3.10.3.0
    Starting     cabal-install-solver-3.10.3.0 (lib)
    Building     hackage-security-0.6.2.6 (lib)
    Building     cabal-install-solver-3.10.3.0 (lib)
    Installing   hackage-security-0.6.2.6 (lib)
    Completed    hackage-security-0.6.2.6 (lib)
    Installing   cabal-install-solver-3.10.3.0 (lib)
    Completed    cabal-install-solver-3.10.3.0 (lib)
    Starting     cabal-install-3.10.3.0 (lib)
    Building     cabal-install-3.10.3.0 (lib)
    Installing   cabal-install-3.10.3.0 (lib)
    Completed    cabal-install-3.10.3.0 (lib)
    Starting     cabal-install-3.10.3.0 (exe:cabal)
    Building     cabal-install-3.10.3.0 (exe:cabal)
    Installing   cabal-install-3.10.3.0 (exe:cabal)
    Completed    cabal-install-3.10.3.0 (exe:cabal)
    Symlinking 'cabal' to '~/.cabal/bin/cabal'

.. warning::

    There is currently no command to show the available targets, but ``cabal
    targets`` has been proposed for this purpose with `cabal#9744 <pr-targets_>`_.

Projects
========

Even larger, projects are a collections of packages. These allow us to develop a
set of related packages, to develop a product and to depend on unpublished
packages that we can get from source code repositories or other means.

- **Source Code Repositories** - It is possible to depend on packages that are
  in a source code repository.
- **Vendored Packages** - When source code for a package is copied locally and
  used if it was a local package.

Building with Stackage
======================

There are two main build tools in the Haskell ecosystem, Cabal and Stack with
exe names ``cabal`` and ``stack``. The main difference between them is how they deal
with dependencies in their projects. Stack works with a Stackage resolver and
any dependency that is not included in the resolver must be pinned to an exact
version as an extra dependency. Cabal can work this way too but has a built-in
dependency solver that will pick versions of dependencies that are not pinned,
if it can.

Stack's project is a ``.yaml`` file and Cabal's is a ``.project`` file (by
convention). Each tools' command allows specifying alternate projects with
options, shown below specifying the default project names.

- ``--stack-yaml=stack.yaml``
- ``--project-file=cabal.project``

Both tools will pick up the project implicitly if it uses the default project
file name.

.. info::

    Everything in a Stack project must be in the one file. That's a limitation of
    ``YAML``. The ``.project`` file format has no formal specification but uses the same
    parser as the ``.cabal`` format that does, reusing some of the same fields as well
    as having some fields specific to a project. The ``import`` field can be used to
    import another project file configuration fragment and this is how Cabal can use
    Stackage resolvers.

    .. code-block:: cabal

        import: https://www.stackage.org/nightly-2024-06-13/cabal.config

    .. code-block:: shell

        $ curl -fsSL https://www.stackage.org/nightly-2024-06-13/cabal.config
        ...
        with-compiler: ghc-9.8.2
        constraints: abstract-deque ==0.3,
                    abstract-deque-tests ==0.3,
                    abstract-par ==0.3.3,
        ...
                    zlib-clib ==1.3.1,
                    zot ==0.0.3,
                    zstd ==0.1.3.0

.. warning::

    While importing directly from Stackage may work, it can lead to unsolveable
    version constraints. The way around this is to download the ``cabal.config``
    from Stackage for the resolver you want to use and then to comment out any
    conflicting version constraints.

.. warning::

    While Stack can work with Stackage ``ghc-x.y.z`` resolvers, no such resolver is
    provided in ``cabal.config`` (cabal project) format.

    .. code-block:: shell

        $ curl -fsSL https://www.stackage.org/ghc-9.8.2/cabal.config
        curl: (22) The requested URL returned error: 404

Building without Stackage
=========================

A Cabal project can be set up without importing constraints from Stackage.  If
you encounter constraint solver failures then picking a subset of a Stackage
resolvers' version constraints may help resolve the problem quicker than
fiddling with version choices and ``allow-newer`` exeptions until the constraint
solver is happy.

Extra Dependencies
==================

Extra dependencies are a Stack concept that doesn't really exist in Cabal.
These are exact versions of packages that a project depends on that are not
included with the resolver in use (``snapshot`` is a synonym of ``resolver``). Here
are Stack's own extra dependencies:

.. code-block:: yaml

    extra-deps:
      # lts-22.21 provides pantry-0.9.3.2.
      - pantry-0.10.0@sha256:6f99ee8d7cfeeb0e2513638618acf80c72d018e7f10120048fa120a409b9dcd2,7864
      # lts-22.21 provides tar-0.5.1.1, which does not support Unicode filenames:
      - tar-0.6.2.0@sha256:619828cae098a7b6deeb0316e12f55011101d88f756787ed024ceedb81cf1eba,4576

.. info::

    If you're committing the ``stack.yaml.lock`` file then it is enough to leave off
    the hash as the ``.lock`` file contains that detail. This way we can see that
    Stack's ``extra-deps`` are exact version equality constraints.

    .. code-block:: yaml

    extra-deps:
      - pantry-0.10.0
      - tar-0.6.2.0

The same exact version equality constraints in a ``cabal.project`` would be:

.. code-block:: cabal

    constraints:
        pantry ==0.10.0
      , tar ==0.6.2.0

Stack needs these versions to be explicitly declared but Cabal will use its dependency
solver to fill in the gaps.

Whether using Stack or Cabal, the versions of dependencies needs to fit within
the version ranges for dependencies as specified in the ``build-depends`` field of
the package description. There is a way of relaxing the version constraints with
``--allow-newer`` but this should only be used as a temporary workaround in order
to get a project to build. If there's a version range bound problem with a
dependency then you may fork it and fix the problem there (and hopefully
upstreaming the change) or you can ask the maintainer for a Hackage revision of
the package to relax an upper bound.

Source Dependencies
===================

From this snippet of a ``cabal.project`` for
`unison/cabal.project <updo-unison-project_>`_, we can see that it is possible to
pull in dependencies from a source code repository (in addition to some version
constraints) with ``source-repository-package`` stanzas.

.. code-block:: cabal

    import: ./project-stackage/lts-20.26.config

    source-repository-package
      type: git
      location: https://github.com/unisonweb/configurator
      tag: e47e9e9fe1f576f8c835183b9def52d73c01327a
    source-repository-package
      type: git
      location: https://github.com/unisonweb/haskeline
      tag: 9275eea7982dabbf47be2ba078ced669ae7ef3d5

The Stack equivalent is very similar:

.. code-block:: yaml

    resolver: lts-20.26
    extra-deps:
      - git: https://github.com/unisonweb/configurator
        commit: e47e9e9fe1f576f8c835183b9def52d73c01327a
      - git: https://github.com/unisonweb/haskeline
        commit: 9275eea7982dabbf47be2ba078ced669ae7ef3d5

Package (and Description) Generators
====================================

Starting with a blank slate, ``cabal init`` can be used to generate a skeleton
package. This command will interactively walk you through package creation,
collecting required inputs and asking you to choose from the available options.

.. code-block:: shell

    $ mkdir flash-new-package

    $ cd flash-new-package/

    $ cabal init
    What does the package build:
      1) Library
    * 2) Executable
      3) Library and Executable
      4) Test suite
    ...
    Add informative comments to each field in the cabal file. (y/n)? [default: y]
    [Log] Using cabal specification: 3.0
    [Log] Creating fresh file LICENSE...
    [Log] Creating fresh file CHANGELOG.md...
    [Log] Creating fresh directory ./app...
    [Log] Creating fresh file app/Main.hs...
    [Log] Creating fresh file flash-new-package.cabal...
    [Warning] No synopsis given. You should edit the .cabal file and add one.
    [Info] You may want to edit the .cabal file and add a Description field.

    $ tree .
    .
    ├── app
    │   └── Main.hs
    ├── CHANGELOG.md
    ├── flash-new-package.cabal
    └── LICENSE

Stack bundles `hpack <hpack_>`_. This is a package description file generator that
generates a ``.cabal`` file from a ``package.yaml``. This is similar to the ``.cabal``
description except that it used different names for some fields (different
phraseology) and can infer some fields (detecting modules from disk) and expand
on terser values. The ``hpack`` command can be used standalone and there is a
similar ``dhall-hpack-cabal`` command that takes its import from a ``package.dhall``
file. Ultimately Stack deals with the ``.cabal`` file whether it is generated or
not, the same way Cabal does, as the package description.

.. _cabal-install-pkg: https://hackage.haskell.org/package/cabal-install
.. _target-forms: https://cabal.readthedocs.io/en/latest/cabal-commands.html#target-forms
.. _pr-targets: https://github.com/haskell/cabal/pull/9744
.. _ghcup: https://www.haskell.org/ghcup/
.. _hpack: https://github.com/sol/hpack
.. _hpack-dhall: https://github.com/cabalism/hpack-dhall#use
.. _updo-unison-project: https://github.com/up-do/unison/blob/add/updo/cabal.project

.. [#] We recommend using GHCup to install ``cabal`` so it is best not to also
    install it yourself by other means unless you intend to hack on Cabal.
