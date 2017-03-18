-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.html

module Lucene.Search.BooleanClause
  ( JBooleanClause(..)
  ) where

import Language.Java.Extra

type T = 'Class "org.apache.lucene.search.BooleanClause"

newtype JBooleanClause
  = JBooleanClause (J T)

instance Coercible JBooleanClause T

instance JReference JBooleanClause where
  type JTy JBooleanClause = T

instance Subclass JBooleanClause where
  type Super JBooleanClause = JObject
