-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/Query.html

module Lucene.Search.Query
  ( JQuery(..)
  ) where

import Language.Java.Extra

type T
  = 'Class "org.apache.lucene.search.Query"

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/Query.html
newtype JQuery
  = JQuery (J T)

instance Coercible JQuery T

instance JReference JQuery where
  type JTy JQuery = T

instance Subclass JQuery where
  type Super JQuery = JObject
