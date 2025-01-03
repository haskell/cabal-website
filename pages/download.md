---
title: Downloading Cabal
subtitle: Ways to download and install Cabal's executable tool <samp>cabal</samp>.
description: The tool's explicit target form is <samp>cabal-install:exe:cabal</samp>, the executable named <samp>cabal</samp> from the <samp>cabal-install</samp> package.
---

## Install/Upgrade

::: tip
Most people with `GHC` will already have `cabal` because it is included with
[GHCup][ghcup], the recommended way to install `GHC` and `cabal`.
:::

If you want to upgrade to the latest stable version, use GHCup again or use `cabal` itself:

    $ cabal install cabal cabal-install

Sometimes the older installed version is still on the program search $PATH, you
can check you're running the latest version with:

    $ cabal --version

::: warning
If mixing installation methods, be careful about PATH precedence.
:::

## Alternative Sources

Packages for Debian (multiple versions) are available on the
[Haskell.org APT repository](http://downloads.haskell.org/debian/).

Packages for Windows are available via
[Chocolatey](https://chocolatey.org/packages/cabal).

## Documentation

For Cabal and cabal-install documentation, please see the [User's
guide][users-guide], the [API documentation][api-guide], and the [Cabal change
log][changelog].

## Bugs

Report bugs [here](https://github.com/haskell/cabal/issues) or to the
[cabal-devel](mailto:cabal-devel@haskell.org) mailing list.

## Code

You can get the development version of the code at [github/haskell/cabal](https://github.com/haskell/cabal).

## Version Numbers

Stable Releases are numbered `a.b.c.d`, where `b` is even. Unstable snapshots
between releases are numbered `a.b.c.d`, where `b` is odd. Changes for `c` and
`d` are minor.

For example, `2.1.x.x` is the development version leading up to the stable
release `2.2.x.x`.

## Included with GHC

The `Cabal` library versions bundled with the latest in each `ghc-x.y.*` series
are:

- `ghc-9.10.1` includes `Cabal-3.12.0.0`
- `ghc-9.8.2` includes `Cabal-3.10.2.0`
- `ghc-9.6.5` includes `Cabal-3.10.3.0`
- `ghc-9.4.8` includes `Cabal-3.8.1.0`
- `ghc-9.2.8` includes `Cabal-3.6.3.0`
- `ghc-9.0.2` includes `Cabal-3.4.1.0`
- `ghc-8.10.7` includes `Cabal-3.2.1.0`
- `ghc-8.8.4` includes `Cabal-3.0.1.0`
- `ghc-8.6.5` includes `Cabal-2.4.0.1`
- `ghc-8.4.4` includes `Cabal-2.2.0.1`
- `ghc-8.2.2` includes `Cabal-2.0.1.0`
- `ghc-8.0.2` includes `Cabal-1.24.2.0`
- `ghc-7.10.3` includes `Cabal-1.22.5.0`

::: tip
Libraries, such as `Cabal` (and more recently, `Cabal-syntax`) included with
each `ghc-x.y.z` version can be found by substituting for `x.y.z` in:

`https://downloads.haskell.org/~ghc/x.y.z/docs/users_guide/x.y.z-notes.html#included-libraries`
:::

You can browse older releases at [downloads.haskell.org/~cabal](https://downloads.haskell.org/~cabal).

[ghcup]: https://www.haskell.org/ghcup
[users-guide]: https://cabal.readthedocs.io
[api-guide]: http://hackage.haskell.org/package/Cabal
[changelog]: http://hackage.haskell.org/package/Cabal/changelog
