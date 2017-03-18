-- | https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html

module Java.IO.Serializable
  ( JSerializable(..)
  ) where

import Language.Java.Extra

type T
  = 'Iface "java.io.Serializable"

newtype JSerializable
  = JSerializable (J T)

instance Coercible JSerializable T

instance JReference JSerializable where
  type JTy JSerializable = T
