-- | https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html

{-# language UndecidableInstances #-}

module Java.Util.Function.Consumer
  ( JConsumer(..)
  ) where

import Data.Constraint
import Data.Constraint.Lifting (Lifting(lifting))
import Language.Java.Extra

type T a
  = 'Generic ('Iface "java.util.function.Consumer") '[a]

newtype JConsumer a
  = JConsumer (J (T (Interp a)))

type instance Interp (JConsumer a) = T (Interp a)

instance (Reference a, b ~ T (Interp a)) => Coercible (JConsumer a) b

instance Reference a => Reference (JConsumer a)

instance Lifting Reference JConsumer where
  lifting :: Reference a :- Reference (JConsumer a)
  lifting = Sub Dict
