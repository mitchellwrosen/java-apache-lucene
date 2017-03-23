-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html

{-# language ScopedTypeVariables  #-}
{-# language UndecidableInstances #-}

module Java.Lang.Comparable
  ( JComparable(..)
  , compareTo
  ) where

import Language.Java.Extra

import Data.Constraint
import Data.Constraint.Lifting (Lifting(lifting))
import Data.Int (Int32)

type T a
  = 'Generic ('Iface "java.lang.Comparable") '[a]

newtype JComparable a
  = JComparable (J (T (Interp a)))

type instance Interp (JComparable a) = T (Interp a)

instance (Reference a, b ~ T (Interp a)) => Coercible (JComparable a) b

instance Reference a => Reference (JComparable a)

instance Lifting Reference JComparable where
  lifting :: Reference a :- Reference (JComparable a)
  lifting = Sub Dict

compareTo :: IsA1 self JComparable t => self -> t -> IO Int32
compareTo self x = call self "compareTo" [jvalue (objcast x)]
