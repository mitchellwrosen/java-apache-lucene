-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html

module Java.Lang.Object
  ( clone
  , equals
  , getClass
  , hashCode
  , toString
  ) where

import Data.Int (Int32)
import Language.Java.Extra

-- | http://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#clone--
clone :: Reference a => a -> IO JObject
clone self = call self "clone" []

-- | http://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#equals-java.lang.Object-
equals :: Reference a => a -> IO Bool
equals self = call self "equals" []

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#getClass--
getClass :: Reference a => a -> IO JClass
getClass self = call self "getClass" []

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#hashCode--
hashCode :: Reference a => a -> IO Int32
hashCode self = call self "hashCode" []

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#toString--
toString :: Reference a => a -> IO JString
toString self = call self "toString" []
