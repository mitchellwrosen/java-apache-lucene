{-# language DefaultSignatures      #-}
{-# language TypeFamilyDependencies #-}
{-# language UndecidableInstances   #-}

module Language.Java.Extra
  ( JReference(..)
  , Subclass
  , Super
  , super
  , Extends
  , upcast
  , Implements
  , Implements1
  , module Language.Java
  ) where

import Data.Constraint.Lifting (Lifting)
import Language.Java hiding (upcast)
import Unsafe.Coerce (unsafeCoerce)

import qualified Data.Coerce as Coerce

class ( Coerce.Coercible a (J (JTy a))
      , Coercible a (JTy a)
      , IsReferenceType (JTy a)
      ) => JReference a where
  type JTy a = (b :: JType) | b -> a

instance JReference JObject where
  type JTy JObject = 'Class "java.lang.Object"

class (JReference a, JReference (Super a)) => Subclass a where
  type Super a

  super :: a -> Super a
  super = unsafeCoerce

class Extends a b where
  upcast :: a -> b
  upcast = unsafeCoerce

instance Extends a a

instance {-# OVERLAPPABLE #-} Extends (Super a) b => Extends a b

class (JReference a, JReference b) => Implements a b

instance {-# OVERLAPPABLE #-}
  (JReference a, JReference b, Implements (Super a) b)
    => Implements a b

class (JReference a, JReference c, Lifting JReference b)
  => Implements1 a b c | a b -> c

instance (JReference (f a), Lifting JReference f) => Implements1 (f a) f a

instance {-# OVERLAPPABLE #-}
  (JReference a, JReference c, Lifting JReference b, Implements1 (Super a) b c)
    => Implements1 a b c
