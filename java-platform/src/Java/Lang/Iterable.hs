-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html

{-# language UndecidableInstances #-}

module Java.Lang.Iterable where

import Java.Util.Iterator (JIterator)
import Java.Util.Function.Consumer (JConsumer)
import Language.Java.Extra

import Data.Constraint
import Data.Constraint.Lifting (Lifting, lifting)

type T a
  = 'Generic ('Iface "java.lang.Iterable") '[a]

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html
newtype JIterable a
  = JIterable (J (T (Interp a)))

type instance Interp (JIterable a) = T (Interp a)

instance (Reference a, b ~ T (Interp a)) => Coercible (JIterable a) b

instance Reference a => Reference (JIterable a)

instance Lifting Reference JIterable where
  lifting :: Reference a :- Reference (JIterable a)
  lifting = Sub Dict

forEach
  :: (Implements1 a JIterable b, Extends b c)
  => a -> JConsumer c -> IO ()
forEach iter consumer = call iter "forEach" [coerce consumer]

iterator
  :: (Implements1 a JIterable b)
  => a -> IO (JIterator b)
iterator iter = call iter "iterator" []
