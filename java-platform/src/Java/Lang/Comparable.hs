-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html

{-# language ScopedTypeVariables #-}

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
  = JComparable (J (T (JTy a)))

instance Lifting JReference JComparable where
  lifting :: JReference a :- JReference (JComparable a)
  lifting = Sub Dict

compareTo :: forall a b. Implements1 a JComparable b => a -> b -> IO Int32
compareTo x y = call x "compareTo" [coerce (JNI.upcast y')]
 where
  y' :: J (JTy b)
  y' = Coerce.coerce y
