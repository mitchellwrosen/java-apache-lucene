-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/Query.html

{-# language UndecidableInstances #-}

module Lucene.Search.Query
  ( JQuery
  ) where

import Language.Java.Extra

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/Query.html
type JQuery
  = J ('Class "org.apache.lucene.search.Query")

instance Reference JQuery

instance Subclass JQuery where
  type Super JQuery = JObject
