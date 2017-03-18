-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html

{-# language ScopedTypeVariables  #-}
{-# language UndecidableInstances #-}

module Java.Util.Iterator
  ( JIterator(..)
  , hasNext
  , next
  , remove
  ) where

import Data.Constraint
import Data.Constraint.Lifting (Lifting, lifting)
import Language.Java.Extra
import Unsafe.Coerce (unsafeCoerce)

type T a
  = 'Generic ('Iface "java.util.Iterator") '[a]

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html
newtype JIterator a
  = JIterator (J (T (JTy a)))

instance (JReference a, b ~ T (JTy a)) => Coercible (JIterator a) b

instance JReference a => JReference (JIterator a) where
  type JTy (JIterator a) = T (JTy a)

instance Lifting JReference JIterator where
  lifting :: JReference a :- JReference (JIterator a)
  lifting = Sub Dict

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#hasNext--
hasNext :: Implements1 a JIterator b => a -> IO Bool
hasNext iter = call iter "hasNext" []

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#next--
next :: Implements1 a JIterator b => a -> IO b
next iter = do
  result :: JObject <- call iter "next" []
  pure (unsafeCoerce result)

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#remove--
remove :: Implements1 a JIterator b => a -> IO ()
remove iter = call iter "remove" []
