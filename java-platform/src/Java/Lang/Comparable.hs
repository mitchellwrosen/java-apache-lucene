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

import qualified Data.Coerce as Coerce
import qualified Foreign.JNI.Types as JNI

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

compareTo :: forall a b. Implements1 a JComparable b => a -> b -> IO Int32
compareTo self x = call self "compareTo" [jvalue (JNI.upcast x')]
 where
  x' :: J (Interp b)
  x' = Coerce.coerce x
