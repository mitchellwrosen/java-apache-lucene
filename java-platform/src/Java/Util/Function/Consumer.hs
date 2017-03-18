-- | https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html

module Java.Util.Function.Consumer
  ( JConsumer(..)
  ) where

import Language.Java.Extra

type T a
  = 'Generic ('Iface "java.util.function.Consumer") '[a]

newtype JConsumer a
  = JConsumer (J (T (JTy a)))
