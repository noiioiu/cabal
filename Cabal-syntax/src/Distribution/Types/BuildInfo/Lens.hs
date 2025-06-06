{-# LANGUAGE DataKinds #-}

module Distribution.Types.BuildInfo.Lens
  ( BuildInfo
  , HasBuildInfo (..)
  , HasBuildInfos (..)
  ) where

import Distribution.Compat.Lens
import Distribution.Compat.Prelude
import Prelude ()

import Distribution.Compiler (PerCompilerFlavor)
import Distribution.ModuleName (ModuleName)
import Distribution.Types.BuildInfo (BuildInfo)
import Distribution.Types.Dependency (Dependency)
import Distribution.Types.ExeDependency (ExeDependency)
import Distribution.Types.LegacyExeDependency (LegacyExeDependency)
import Distribution.Types.Mixin (Mixin)
import Distribution.Types.PkgconfigDependency (PkgconfigDependency)
import Distribution.Utils.Path
import Language.Haskell.Extension (Extension, Language)

import qualified Distribution.Types.BuildInfo as T

-- | Classy lenses for 'BuildInfo'.
class HasBuildInfo a where
  buildInfo :: Lens' a BuildInfo

  buildable :: Lens' a Bool
  buildable = buildInfo . buildable
  {-# INLINE buildable #-}

  buildTools :: Lens' a [LegacyExeDependency]
  buildTools = buildInfo . buildTools
  {-# INLINE buildTools #-}

  buildToolDepends :: Lens' a [ExeDependency]
  buildToolDepends = buildInfo . buildToolDepends
  {-# INLINE buildToolDepends #-}

  cppOptions :: Lens' a [String]
  cppOptions = buildInfo . cppOptions
  {-# INLINE cppOptions #-}

  asmOptions :: Lens' a [String]
  asmOptions = buildInfo . asmOptions
  {-# INLINE asmOptions #-}

  cmmOptions :: Lens' a [String]
  cmmOptions = buildInfo . cmmOptions
  {-# INLINE cmmOptions #-}

  ccOptions :: Lens' a [String]
  ccOptions = buildInfo . ccOptions
  {-# INLINE ccOptions #-}

  cxxOptions :: Lens' a [String]
  cxxOptions = buildInfo . cxxOptions
  {-# INLINE cxxOptions #-}

  jsppOptions :: Lens' a [String]
  jsppOptions = buildInfo . jsppOptions
  {-# INLINE jsppOptions #-}

  ldOptions :: Lens' a [String]
  ldOptions = buildInfo . ldOptions
  {-# INLINE ldOptions #-}

  hsc2hsOptions :: Lens' a [String]
  hsc2hsOptions = buildInfo . hsc2hsOptions
  {-# INLINE hsc2hsOptions #-}

  pkgconfigDepends :: Lens' a [PkgconfigDependency]
  pkgconfigDepends = buildInfo . pkgconfigDepends
  {-# INLINE pkgconfigDepends #-}

  frameworks :: Lens' a [RelativePath Framework File]
  frameworks = buildInfo . frameworks
  {-# INLINE frameworks #-}

  extraFrameworkDirs :: Lens' a [SymbolicPath Pkg (Dir Framework)]
  extraFrameworkDirs = buildInfo . extraFrameworkDirs
  {-# INLINE extraFrameworkDirs #-}

  asmSources :: Lens' a [SymbolicPath Pkg File]
  asmSources = buildInfo . asmSources
  {-# INLINE asmSources #-}

  cmmSources :: Lens' a [SymbolicPath Pkg File]
  cmmSources = buildInfo . cmmSources
  {-# INLINE cmmSources #-}

  cSources :: Lens' a [SymbolicPath Pkg File]
  cSources = buildInfo . cSources
  {-# INLINE cSources #-}

  cxxSources :: Lens' a [SymbolicPath Pkg File]
  cxxSources = buildInfo . cxxSources
  {-# INLINE cxxSources #-}

  jsSources :: Lens' a [SymbolicPath Pkg File]
  jsSources = buildInfo . jsSources
  {-# INLINE jsSources #-}

  hsSourceDirs :: Lens' a [SymbolicPath Pkg (Dir Source)]
  hsSourceDirs = buildInfo . hsSourceDirs
  {-# INLINE hsSourceDirs #-}

  otherModules :: Lens' a [ModuleName]
  otherModules = buildInfo . otherModules
  {-# INLINE otherModules #-}

  virtualModules :: Lens' a [ModuleName]
  virtualModules = buildInfo . virtualModules
  {-# INLINE virtualModules #-}

  autogenModules :: Lens' a [ModuleName]
  autogenModules = buildInfo . autogenModules
  {-# INLINE autogenModules #-}

  defaultLanguage :: Lens' a (Maybe Language)
  defaultLanguage = buildInfo . defaultLanguage
  {-# INLINE defaultLanguage #-}

  otherLanguages :: Lens' a [Language]
  otherLanguages = buildInfo . otherLanguages
  {-# INLINE otherLanguages #-}

  defaultExtensions :: Lens' a [Extension]
  defaultExtensions = buildInfo . defaultExtensions
  {-# INLINE defaultExtensions #-}

  otherExtensions :: Lens' a [Extension]
  otherExtensions = buildInfo . otherExtensions
  {-# INLINE otherExtensions #-}

  oldExtensions :: Lens' a [Extension]
  oldExtensions = buildInfo . oldExtensions
  {-# INLINE oldExtensions #-}

  extraLibs :: Lens' a [String]
  extraLibs = buildInfo . extraLibs
  {-# INLINE extraLibs #-}

  extraLibsStatic :: Lens' a [String]
  extraLibsStatic = buildInfo . extraLibsStatic
  {-# INLINE extraLibsStatic #-}

  extraGHCiLibs :: Lens' a [String]
  extraGHCiLibs = buildInfo . extraGHCiLibs
  {-# INLINE extraGHCiLibs #-}

  extraBundledLibs :: Lens' a [String]
  extraBundledLibs = buildInfo . extraBundledLibs
  {-# INLINE extraBundledLibs #-}

  extraLibFlavours :: Lens' a [String]
  extraLibFlavours = buildInfo . extraLibFlavours
  {-# INLINE extraLibFlavours #-}

  extraDynLibFlavours :: Lens' a [String]
  extraDynLibFlavours = buildInfo . extraDynLibFlavours
  {-# INLINE extraDynLibFlavours #-}

  extraLibDirs :: Lens' a [SymbolicPath Pkg (Dir Lib)]
  extraLibDirs = buildInfo . extraLibDirs
  {-# INLINE extraLibDirs #-}

  extraLibDirsStatic :: Lens' a [SymbolicPath Pkg (Dir Lib)]
  extraLibDirsStatic = buildInfo . extraLibDirsStatic
  {-# INLINE extraLibDirsStatic #-}

  includeDirs :: Lens' a [SymbolicPath Pkg (Dir Include)]
  includeDirs = buildInfo . includeDirs
  {-# INLINE includeDirs #-}

  includes :: Lens' a [SymbolicPath Include File]
  includes = buildInfo . includes
  {-# INLINE includes #-}

  autogenIncludes :: Lens' a [RelativePath Include File]
  autogenIncludes = buildInfo . autogenIncludes
  {-# INLINE autogenIncludes #-}

  installIncludes :: Lens' a [RelativePath Include File]
  installIncludes = buildInfo . installIncludes
  {-# INLINE installIncludes #-}

  options :: Lens' a (PerCompilerFlavor [String])
  options = buildInfo . options
  {-# INLINE options #-}

  profOptions :: Lens' a (PerCompilerFlavor [String])
  profOptions = buildInfo . profOptions
  {-# INLINE profOptions #-}

  sharedOptions :: Lens' a (PerCompilerFlavor [String])
  sharedOptions = buildInfo . sharedOptions
  {-# INLINE sharedOptions #-}

  profSharedOptions :: Lens' a (PerCompilerFlavor [String])
  profSharedOptions = buildInfo . profSharedOptions
  {-# INLINE profSharedOptions #-}

  staticOptions :: Lens' a (PerCompilerFlavor [String])
  staticOptions = buildInfo . staticOptions
  {-# INLINE staticOptions #-}

  customFieldsBI :: Lens' a [(String, String)]
  customFieldsBI = buildInfo . customFieldsBI
  {-# INLINE customFieldsBI #-}

  targetBuildDepends :: Lens' a [Dependency]
  targetBuildDepends = buildInfo . targetBuildDepends
  {-# INLINE targetBuildDepends #-}

  mixins :: Lens' a [Mixin]
  mixins = buildInfo . mixins
  {-# INLINE mixins #-}

instance HasBuildInfo BuildInfo where
  buildInfo = id
  {-# INLINE buildInfo #-}

  buildable f s = fmap (\x -> s{T.buildable = x}) (f (T.buildable s))
  {-# INLINE buildable #-}

  buildTools f s = fmap (\x -> s{T.buildTools = x}) (f (T.buildTools s))
  {-# INLINE buildTools #-}

  buildToolDepends f s = fmap (\x -> s{T.buildToolDepends = x}) (f (T.buildToolDepends s))
  {-# INLINE buildToolDepends #-}

  cppOptions f s = fmap (\x -> s{T.cppOptions = x}) (f (T.cppOptions s))
  {-# INLINE cppOptions #-}

  asmOptions f s = fmap (\x -> s{T.asmOptions = x}) (f (T.asmOptions s))
  {-# INLINE asmOptions #-}

  cmmOptions f s = fmap (\x -> s{T.cmmOptions = x}) (f (T.cmmOptions s))
  {-# INLINE cmmOptions #-}

  ccOptions f s = fmap (\x -> s{T.ccOptions = x}) (f (T.ccOptions s))
  {-# INLINE ccOptions #-}

  cxxOptions f s = fmap (\x -> s{T.cxxOptions = x}) (f (T.cxxOptions s))
  {-# INLINE cxxOptions #-}

  jsppOptions f s = fmap (\x -> s{T.jsppOptions = x}) (f (T.jsppOptions s))
  {-# INLINE jsppOptions #-}

  ldOptions f s = fmap (\x -> s{T.ldOptions = x}) (f (T.ldOptions s))
  {-# INLINE ldOptions #-}

  hsc2hsOptions f s = fmap (\x -> s{T.hsc2hsOptions = x}) (f (T.hsc2hsOptions s))
  {-# INLINE hsc2hsOptions #-}

  pkgconfigDepends f s = fmap (\x -> s{T.pkgconfigDepends = x}) (f (T.pkgconfigDepends s))
  {-# INLINE pkgconfigDepends #-}

  frameworks f s = fmap (\x -> s{T.frameworks = x}) (f (T.frameworks s))
  {-# INLINE frameworks #-}

  extraFrameworkDirs f s = fmap (\x -> s{T.extraFrameworkDirs = x}) (f (T.extraFrameworkDirs s))
  {-# INLINE extraFrameworkDirs #-}

  asmSources f s = fmap (\x -> s{T.asmSources = x}) (f (T.asmSources s))
  {-# INLINE asmSources #-}

  cmmSources f s = fmap (\x -> s{T.cmmSources = x}) (f (T.cmmSources s))
  {-# INLINE cmmSources #-}

  cSources f s = fmap (\x -> s{T.cSources = x}) (f (T.cSources s))
  {-# INLINE cSources #-}

  cxxSources f s = fmap (\x -> s{T.cSources = x}) (f (T.cxxSources s))
  {-# INLINE cxxSources #-}

  jsSources f s = fmap (\x -> s{T.jsSources = x}) (f (T.jsSources s))
  {-# INLINE jsSources #-}

  hsSourceDirs f s = fmap (\x -> s{T.hsSourceDirs = x}) (f (T.hsSourceDirs s))
  {-# INLINE hsSourceDirs #-}

  otherModules f s = fmap (\x -> s{T.otherModules = x}) (f (T.otherModules s))
  {-# INLINE otherModules #-}

  virtualModules f s = fmap (\x -> s{T.virtualModules = x}) (f (T.virtualModules s))
  {-# INLINE virtualModules #-}

  autogenModules f s = fmap (\x -> s{T.autogenModules = x}) (f (T.autogenModules s))
  {-# INLINE autogenModules #-}

  defaultLanguage f s = fmap (\x -> s{T.defaultLanguage = x}) (f (T.defaultLanguage s))
  {-# INLINE defaultLanguage #-}

  otherLanguages f s = fmap (\x -> s{T.otherLanguages = x}) (f (T.otherLanguages s))
  {-# INLINE otherLanguages #-}

  defaultExtensions f s = fmap (\x -> s{T.defaultExtensions = x}) (f (T.defaultExtensions s))
  {-# INLINE defaultExtensions #-}

  otherExtensions f s = fmap (\x -> s{T.otherExtensions = x}) (f (T.otherExtensions s))
  {-# INLINE otherExtensions #-}

  oldExtensions f s = fmap (\x -> s{T.oldExtensions = x}) (f (T.oldExtensions s))
  {-# INLINE oldExtensions #-}

  extraLibs f s = fmap (\x -> s{T.extraLibs = x}) (f (T.extraLibs s))
  {-# INLINE extraLibs #-}

  extraLibsStatic f s = fmap (\x -> s{T.extraLibsStatic = x}) (f (T.extraLibsStatic s))
  {-# INLINE extraLibsStatic #-}

  extraGHCiLibs f s = fmap (\x -> s{T.extraGHCiLibs = x}) (f (T.extraGHCiLibs s))
  {-# INLINE extraGHCiLibs #-}

  extraBundledLibs f s = fmap (\x -> s{T.extraBundledLibs = x}) (f (T.extraBundledLibs s))
  {-# INLINE extraBundledLibs #-}

  extraLibFlavours f s = fmap (\x -> s{T.extraLibFlavours = x}) (f (T.extraLibFlavours s))
  {-# INLINE extraLibFlavours #-}

  extraDynLibFlavours f s = fmap (\x -> s{T.extraDynLibFlavours = x}) (f (T.extraDynLibFlavours s))
  {-# INLINE extraDynLibFlavours #-}

  extraLibDirs f s = fmap (\x -> s{T.extraLibDirs = x}) (f (T.extraLibDirs s))
  {-# INLINE extraLibDirs #-}

  extraLibDirsStatic f s = fmap (\x -> s{T.extraLibDirsStatic = x}) (f (T.extraLibDirsStatic s))
  {-# INLINE extraLibDirsStatic #-}

  includeDirs f s = fmap (\x -> s{T.includeDirs = x}) (f (T.includeDirs s))
  {-# INLINE includeDirs #-}

  includes f s = fmap (\x -> s{T.includes = x}) (f (T.includes s))
  {-# INLINE includes #-}

  autogenIncludes f s = fmap (\x -> s{T.autogenIncludes = x}) (f (T.autogenIncludes s))
  {-# INLINE autogenIncludes #-}

  installIncludes f s = fmap (\x -> s{T.installIncludes = x}) (f (T.installIncludes s))
  {-# INLINE installIncludes #-}

  options f s = fmap (\x -> s{T.options = x}) (f (T.options s))
  {-# INLINE options #-}

  profOptions f s = fmap (\x -> s{T.profOptions = x}) (f (T.profOptions s))
  {-# INLINE profOptions #-}

  sharedOptions f s = fmap (\x -> s{T.sharedOptions = x}) (f (T.sharedOptions s))
  {-# INLINE sharedOptions #-}

  profSharedOptions f s = fmap (\x -> s{T.profSharedOptions = x}) (f (T.profSharedOptions s))
  {-# INLINE profSharedOptions #-}

  staticOptions f s = fmap (\x -> s{T.staticOptions = x}) (f (T.staticOptions s))
  {-# INLINE staticOptions #-}

  customFieldsBI f s = fmap (\x -> s{T.customFieldsBI = x}) (f (T.customFieldsBI s))
  {-# INLINE customFieldsBI #-}

  targetBuildDepends f s = fmap (\x -> s{T.targetBuildDepends = x}) (f (T.targetBuildDepends s))
  {-# INLINE targetBuildDepends #-}

  mixins f s = fmap (\x -> s{T.mixins = x}) (f (T.mixins s))
  {-# INLINE mixins #-}

class HasBuildInfos a where
  traverseBuildInfos :: Traversal' a BuildInfo
