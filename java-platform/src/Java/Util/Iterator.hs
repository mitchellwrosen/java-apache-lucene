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
  = JIterator (J (T (Interp a)))

type instance Interp (JIterator a) = T (Interp a)

instance (Reference a, b ~ T (Interp a)) => Coercible (JIterator a) b

instance Reference a => Reference (JIterator a)

instance Lifting Reference JIterator where
  lifting :: Reference a :- Reference (JIterator a)
  lifting = Sub Dict

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#hasNext--
hasNext :: IsA1 self JIterator t => self -> IO Bool
hasNext self = call self "hasNext" []

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#next--
next :: IsA1 self JIterator t => self -> IO t
next self = do
  result :: JObject <- call self "next" []
  pure (unsafeCoerce result)

-- | https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html#remove--
remove :: IsA1 self JIterator t => self -> IO ()
remove self = call self "remove" []
