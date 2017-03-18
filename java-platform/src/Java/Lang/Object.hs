-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html

module Java.Lang.Object where

import Language.Java.Extra

import Data.Text (Text)

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#toString--
toString :: Extends a JObject => a -> IO Text
toString query = do
  result <- call (upcast query :: JObject) "toString" []
  reify result
