import Distribution.PackageDescription (HookedBuildInfo, PackageDescription)
import Distribution.Simple
import Distribution.Simple.LocalBuildInfo (LocalBuildInfo)
import Distribution.Simple.Setup (BuildFlags)
import Language.Java.Inline.Cabal (gradleBuild, setGradleClasspath)

main = defaultMainWithHooks (simpleUserHooks
  { preBuild = myPreBuild
  , buildHook = myBuildHook
  })

myPreBuild :: Args -> BuildFlags -> IO HookedBuildInfo
myPreBuild = setGradleClasspath

myBuildHook
  :: PackageDescription -> LocalBuildInfo -> UserHooks -> BuildFlags -> IO ()
myBuildHook desc info hooks flags = do
  gradleBuild desc info hooks flags
  buildHook simpleUserHooks desc info hooks flags
