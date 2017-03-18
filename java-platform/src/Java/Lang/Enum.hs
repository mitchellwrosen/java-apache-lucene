-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Enum.html

{-# language UndecidableInstances #-}

module Java.Lang.Enum
  ( JEnum(..)
  ) where

import Java.Lang.Comparable (JComparable)
import Language.Java.Extra

type T a
  = 'Generic ('Class "java.lang.Enum") '[a]

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Enum.html
newtype JEnum a
  = JEnum (J (T (JTy a)))

instance JReference a => JReference (JEnum a) where
  type JTy (JEnum a) = T (JTy a)

instance Subclass (JEnum a) where
  type Super (JEnum a) = JObject

instance Implements1 (JEnum a) JComparable a
