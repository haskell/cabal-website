% Cabal FAQ
%
%

Contents
--------

Select the name of a problem to jump to a full explanation and solution.

[Hidden packages](#hidden-packages)
:    What is this hidden package? You're writing your own package and you get:

:        Could not find module `Data.Map': it is a member of package
         containers-0.1.0.0, which is hidden.

[runProcess: does not exist](#runprocess-does-not-exist)
:    You're building a package on Windows and you get:

:        sh: runProcess: does not exist (No such file or directory)

[ExitFailure 1](#exitfailure-1)
:    `ExitFailure 1` ??!  Where is the real error message?

:       cabal: Error: some packages failed to install: foo-1.0 failed during the
        configure step. The exception was: exit: ExitFailure 1

Hidden packages
---------------

You build a package that you are writing yourself and get a message like:

    Could not find module `Data.Map': it is a member of package
    containers-0.1.0.0, which is hidden.

What you need to do is to add `containers` to the `build-depends` in your
`.cabal` file.

The reason you get this message is because when cabal asks ghc to build your
package, it tells ghc to ignore all available packages except for the ones
explicitly listed in the `.cabal` file. The terminology ghc uses for this is
"hidden".

Do not be confused by the `ghc-pkg` tool commands to `hide` and
`expose` packages. That makes no difference to this issue.


runProcess: does not exist
--------------------------

You try to install a package on Windows and it fails with the message

    sh: runProcess: does not exist (No such file or directory)

What it means is that it cannot find the program `sh.exe` which is needed to
run the `./configure` script that this package uses.

Packages that use `./configure` scripts are not very good citizens on Windows.
They have to be run from within an MSYS shell because `./configure` scripts are
actually Unix shell scripts. The MSYS shell provides all the programs that the
script needs to run.

BTW, if you want to make the error message better see Cabal ticket [#403].

[#403]: http://hackage.haskell.org/trac/hackage/ticket/403


ExitFailure 1
-------------

You use cabal to build a bunch of packages and it fails with a message like:

    cabal: Error: some packages failed to install: foo-1.0 failed during the
    configure step. The exception was: exit: ExitFailure 1

Hooray for unhelpful error messages! Although this final message is unhelpful,
there is almost always an actual error message further up in the build log. Try
scrolling up to the bit where it was trying to build that package.
