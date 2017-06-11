module Packages where
import System.Time
import FiniteMap


data PkgIdentifier
    = PkgIdentifier {pkgName::String, pkgVersion::Version}

{- ^Often need name and version since multiple versions of a single
    package can exist on a system. -}

data PackageConfig
   = Package {
        pkgIdent        :: PkgIdentifier,
        license         :: License,
        auto            :: Bool,
        provides        :: [String],
{- ^A bit pi-in-the-sky; might indicate that this package provides
    functionality that other packages also provide, such as a compiler
    or GUI framework, and upon which other packages might depend. -}

        isDefault       :: Bool,
-- ^might indicate if this is the default compiler or GUI framework.

        import_dirs     :: [String],
        source_dirs     :: [String],
        library_dirs    :: [String],
        hs_libraries    :: [String],
        extra_libraries :: [String],
        include_dirs    :: [String],
        c_includes      :: [String],
        build_deps      :: [Dependency], -- build dependencies
        depends         :: [Dependency], -- use dependencies
        extra_ghc_opts  :: [String],
        extra_cc_opts   :: [String],
        extra_ld_opts   :: [String],
        framework_dirs  :: [String],
        extra_frameworks:: [String]}

data Version = DateVersion {versionYear  :: Integer,
                            versionMonth :: Month,
                            versionDay   :: Integer}
	     | NumberedVersion {versionMajor      :: Integer,
				versionMinor      :: Integer,
				versionPatchLevel :: Integer}

data License = GPL | LGPL | BSD | {- ... | -} OtherLicense FilePath

data Dependency = Dependency String VersionRange

data VersionRange
  = AnyVersion
  | OrLaterVersion     Version
  | ExactlyThisVersion Version
  | OrEarlierVersion   Version

type PackageMap = FiniteMap PkgIdentifier PackageConfig



userPkgConfigLocation   :: FilePath
systemPkgConfigLocation :: FilePath
getSystemPkgConfig  :: IO [PackageMap] -- ^Query /etc/haskell/packages.conf
getUserPkgConfig    :: IO [PackageMap] -- ^Query ~/.haskell/packages.conf
getPkgConfig        :: FilePath -> IO [PackageMap]
addUserPackage   :: PackageConfig -> IO ()
addSystemPackage :: PackageConfig -> IO ()
delUserPackage   :: PkgIdentifier -> IO ()
delSystemPackage :: PkgIdentifier -> IO ()
basicPackage     :: PackageConfig          -- provides sensible defaults
checkLicense     :: PackageConfig -> Bool
{- Just for fun, check to see if the licences that this package uses
   conflicts with any of the licences of the packages it depends on -}

userPkgConfigLocation = "~/.haskell/packages.conf"
systemPkgConfigLocation = "etc/haskell/packages.conf"
getSystemPkgConfig  = getPkgConfig systemPkgConfigLocation
getUserPkgConfig    = getPkgConfig userPkgConfigLocation
getPkgConfig _    = return []
addUserPackage _   = error "Foo"
addSystemPackage _ = error "Foo"
delUserPackage   = error "Foo"
delSystemPackage = error "Foo"
basicPackage     = error "Foo"
checkLicense     = error "foo"
{- Just for fun, check to see if the licences that this package uses
   conflicts with any of the licences of the packages it depends on -}
