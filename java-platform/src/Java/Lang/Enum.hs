-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Enum.html

{-# language UndecidableInstances #-}

module Java.Lang.Enum
  ( JEnum(..)
  ) where

import Java.Lang.Comparable (JComparable)

import Data.Constraint
import Data.Constraint.Lifting (Lifting(lifting))
import Language.Java.Extra

type T a
  = 'Generic ('Class "java.lang.Enum") '[a]

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Enum.html
newtype JEnum a
  = JEnum (J (T (Interp a)))

type instance Interp (JEnum a) = T (Interp a)

instance (Reference a, b ~ T (Interp a)) => Coercible (JEnum a) b

instance (Reference a) => Reference (JEnum a)

instance Lifting Reference JEnum where
  lifting = Sub Dict

instance IsA1 a JEnum a => Subclass (JEnum a) where
  type Super (JEnum a) = JObject

instance IsA1 a JEnum a => IsA1 (JEnum a) JComparable a
