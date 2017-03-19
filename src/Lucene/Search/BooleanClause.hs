-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.html

module Lucene.Search.BooleanClause
  ( JBooleanClause
  ) where

import Language.Java.Extra

type JBooleanClause
  = J ('Class "org.apache.lucene.search.BooleanClause")

instance Reference JBooleanClause

instance Subclass JBooleanClause where
  type Super JBooleanClause = JObject
