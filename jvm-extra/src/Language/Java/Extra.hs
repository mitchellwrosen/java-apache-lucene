{-# language UndecidableInstances #-}

module Language.Java.Extra
  ( Reference
  , objcast
  , Subclass(..)
  , IsA(..)
  , IsA1(..)
  , module Language.Java
  ) where

import Data.Constraint.Lifting (Lifting)
import Language.Java hiding (upcast)
import Unsafe.Coerce (unsafeCoerce)

import qualified Data.Coerce as Coerce

-- | A 'Reference' is little more than a 'J' indexed by an 'IsReferenceType'
-- type (or a newtype wrapper around such a thing).
--
-- However, it exists as its own empty typeclass (rather than a type alias)
-- because it's partially applied in the 'Implements1' class.
class ( Coerce.Coercible a (J (Interp a))
      , Coercible a (Interp a)
      , IsReferenceType (Interp a)
      ) => Reference a where

instance Reference JObject

objcast :: Reference self => self -> JObject
objcast = unsafeCoerce

-- | A 'Subclass' is any 'Reference' that is not 'JObject'.
--
-- TODO: Disallow subclassing a final class.
class (Reference a, Reference (Super a)) => Subclass a where
  type Super a

  super :: a -> Super a
  super = unsafeCoerce

-- | Inheritance: @A is-a B@, either tautologically (@A = B@), directly
-- (@A extends/implements B@), or indirectly (@A is-a Z@,
-- @Z extends/implements B@).
class (Reference a, Reference b) => IsA a b where
  upcast :: a -> b
  upcast = unsafeCoerce

-- | @A is-a A@.
instance Reference a => IsA a a

-- | If @A extends B@ and @B is-a C@, then @A is-a C@.
instance {-# OVERLAPPABLE #-}
  (IsA (Super a) b, Reference a, Reference b) => IsA a b

-- | @A implements B<C>@.
class (Reference a, Reference c, Lifting Reference b)
    => IsA1 a b c | a b -> c where
  upcast1 :: a -> b c
  upcast1 = unsafeCoerce

-- | If @A extends B@ and @B implements C<D>@, then @A implements C<D>@.
instance {-# OVERLAPPABLE #-}
  (Reference a, Reference c, Lifting Reference b, IsA1 (Super a) b c)
    => IsA1 a b c
