{-# LANGUAGE OverloadedStrings #-}

import Data.Char (isDigit)
import Data.Foldable
import Data.Function (on)
import Data.List (isPrefixOf, sortBy, stripPrefix)
import Data.Ord (Down (..))
import Data.Version (Version (..), parseVersion)
import Hakyll hiding (pandocCompiler)
import Hakyll.Core.Item (Item (..))
import System.FilePath (takeBaseName, (</>))
import Text.Pandoc.Options
import Text.ParserCombinators.ReadP (ReadP, readP_to_S)

pandocCompiler :: Compiler (Item String)
pandocCompiler =
    pandocCompilerWith
        defaultHakyllReaderOptions
            { readerExtensions =
                disableExtension Ext_smart $ readerExtensions defaultHakyllReaderOptions
            }
        defaultHakyllWriterOptions

main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route idRoute
        compile copyFileCompiler

    match "js/*" $ do
        route idRoute
        compile copyFileCompiler

    match "node_modules/@fortawesome/fontawesome-free/webfonts/*.*" $ do
        route $ customRoute (faFontRoute . toFilePath)
        compile copyFileCompiler

    match
        ( fromList
            ["pages/download.md", "pages/faq.md", "pages/history.md"]
        )
        $ do
            route $ setExtension "html"
            compile $
                pandocCompiler
                    >>= loadAndApplyTemplate "templates/post.html" dateCtx
                    >>= loadAndApplyTemplate "templates/default.html" defaultContext
                    >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $
            pandocCompiler
                >>= loadAndApplyTemplate "templates/post.html" dateCtx
                >>= loadAndApplyTemplate "templates/default.html" dateCtx
                >>= relativizeUrls

    match "release-notes/*" $ do
        route $ setExtension "html"
        compile $
            pandocCompiler
                >>= loadAndApplyTemplate "templates/post.html" dateCtx
                >>= loadAndApplyTemplate "templates/default.html" dateCtx
                >>= relativizeUrls

    create ["releases/index.html"] $ do
        route idRoute
        compile $ do
            versions <- loadAll "release-notes/*"
            let
                title = takeBaseName . toFilePath . itemIdentifier
                filterOn s = filter ((s `isPrefixOf`) . title) versions
                order = sortBy (compare `on` (Down . versionOf . title))

                libs = order $ filterOn "Cabal-"
                exes = order $ filterOn "cabal-install-"
                wips = order $ filterOn "WIP-"

                ctx =
                    fold
                        [ listField "libs" defaultContext (return libs)
                        , listField "exes" defaultContext (return exes)
                        , listField "wips" defaultContext (return wips)
                        , defaultContext
                        ]

            makeItem ""
                >>= loadAndApplyTemplate "templates/releases.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    create ["blog/index.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let
                ctx =
                    fold
                        [ listField "posts" dateCtx (return posts)
                        , defaultContext
                        ]

            makeItem ""
                >>= loadAndApplyTemplate "templates/blog.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    match "index.md" $ do
        route $ setExtension "html"
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let
                indexCtx =
                    fold
                        [ listField "posts" dateCtx (return posts)
                        , defaultContext
                        ]

            pandocCompiler
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

    match "proposal/*.html" $ do
        route idRoute
        compile $ getResourceBody >>= relativizeUrls

    match "proposal-1.0/*.html" $ do
        route idRoute
        compile $ getResourceBody >>= relativizeUrls

    match "proposal-1.1/*.html" $ do
        route idRoute
        compile $ getResourceBody >>= relativizeUrls

dateCtx :: Context String
dateCtx =
    fold
        [ dateField "date" "%Y-%m-%d"
        , defaultContext
        ]

faFontRoute :: FilePath -> FilePath
faFontRoute x
    | Just y <- stripPrefix "node_modules/@fortawesome/fontawesome-free/webfonts/" x =
        "css" </> "fonts" </> y
    | otherwise = error $ "Unexpected fontawesome font of " ++ x

versionOf :: String -> Maybe Version
versionOf s = runReadP parseVersion version
    where
        version :: String
        version = filter (\x -> isDigit x || x == '.') s

-- SEE: hspec's BumpVersion.hs
runReadP :: ReadP a -> String -> Maybe a
runReadP p input = case reverse $ readP_to_S p input of
    (v, "") : _ -> Just v
    _ -> Nothing
