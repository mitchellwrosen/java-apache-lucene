{-# language UndecidableInstances #-}

module Language.Java.Extra
  ( Reference
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

-- | A 'Subclass' is any 'Reference' that is not 'JObject'.
class (Reference a, Reference (Super a)) => Subclass a where
  type Super a

  super :: a -> Super a
  super = unsafeCoerce

-- | Class inheritance: @A is-a B@, either tautologically (@A = B@), directly
-- (@A extends B@), or indirectly (@A is-a Z@, @Z extends B@).
--
-- No additional instances should be added.
class (Reference a, Reference b) => Extends a b where
  upcast :: a -> b
  upcast = unsafeCoerce

-- | @A is-a A@.
instance Reference a => Extends a a

-- | If @A extends B@ and @B is-a C@, then @A is-a C@.
instance {-# OVERLAPPABLE #-}
  (Extends (Super a) b, Reference a, Reference b)
    => Extends a b

-- | @A implements B@.
class (Reference a, Reference b) => Implements a b

-- | If @A extends B@ and @B implements C@, then @A implements C@.
instance {-# OVERLAPPABLE #-}
  (Implements (Super a) b, Reference a, Reference b)
    => Implements a b

-- | @A implements B<C>@.
class (Reference a, Reference c, Lifting Reference b)
  => Implements1 a b c | a b -> c

-- | If @A extends B@ and @B implements C<D>@, then @A implements C<D>@.
instance {-# OVERLAPPABLE #-}
  (Reference a, Reference c, Lifting Reference b, Implements1 (Super a) b c)
    => Implements1 a b c
