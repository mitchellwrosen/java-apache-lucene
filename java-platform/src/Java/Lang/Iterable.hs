-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html

module Java.Lang.Iterable where

import Java.Util.Iterator (JIterator)
import Java.Util.Function.Consumer (JConsumer)
import Language.Java.Extra

import Data.Constraint
import Data.Constraint.Lifting (Lifting, lifting)

type T a
  = 'Generic ('Iface "java.lang.Iterable") '[a]

newtype JIterable a
  = JIterable (J (T (JTy a)))

instance Lifting JReference JIterable where
  lifting :: JReference a :- JReference (JIterable a)
  lifting = Sub Dict

forEach
  :: (Implements1 a JIterable b, Extends b c)
  => a -> JConsumer c -> IO ()
forEach iter consumer = call iter "forEach" [coerce consumer]

iterator
  :: (Implements1 a JIterable b)
  => a -> IO (JIterator b)
iterator iter = call iter "iterator" []
