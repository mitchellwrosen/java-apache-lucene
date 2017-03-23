-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Cloneable.html

module Java.Lang.Cloneable
  ( JCloneable
  ) where

import Language.Java.Extra

-- | https://docs.oracle.com/javase/8/docs/api/java/lang/Cloneable.html
type JCloneable
  = J ('Iface "java.lang.Cloneable")

instance Reference JCloneable
