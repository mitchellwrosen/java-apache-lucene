-- | https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html

module Java.IO.Serializable
  ( JSerializable
  ) where

import Language.Java.Extra

-- | https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html
type JSerializable
  = J ('Iface "java.io.Serializable")

instance Reference JSerializable
