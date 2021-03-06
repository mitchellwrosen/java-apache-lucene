-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/index/Term.html

module Lucene.Index.Term
  ( JTerm
  , new
  ) where

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/index/Term.html
type JTerm
  = J ('Class "org.apache.lucene.index.Term")

instance Reference JTerm

instance Subclass JTerm where
  type Super JTerm = JObject

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/index/Term.html#Term-java.lang.String-java.lang.String-
new :: JString -> JString -> IO JTerm
new field text = Java.new [jvalue field, jvalue text]
