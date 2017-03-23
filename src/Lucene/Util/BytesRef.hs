-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/util/BytesRef.html

module Lucene.Util.BytesRef
  ( JBytesRef
  , new
  , new2
  ) where

import Java.Lang.Cloneable (JCloneable)
import Java.Lang.Comparable (JComparable)
import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/util/BytesRef.html
type JBytesRef
  = J ('Class "org.apache.lucene.util.BytesRef")

instance Reference JBytesRef

instance Subclass JBytesRef where
  type Super JBytesRef = JObject

instance IsA JBytesRef JCloneable
instance IsA1 JBytesRef JComparable JBytesRef

-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/util/BytesRef.html#BytesRef--
new :: IO JBytesRef
new = Java.new []

-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/util/BytesRef.html#BytesRef-byte:A-
new2 :: JByteArray -> IO JBytesRef
new2 bytes = Java.new [jvalue bytes]
