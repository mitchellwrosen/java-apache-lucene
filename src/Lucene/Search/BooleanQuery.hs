-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanQuery.html

module Lucene.Search.BooleanQuery
  ( JBooleanQuery(..)
  ) where

import Java.Lang.Iterable (JIterable)
import Language.Java.Extra hiding (new)
import Lucene.Search.Query (JQuery)
import Lucene.Search.BooleanClause (JBooleanClause)

type T
  = 'Class "org.apache.lucene.search.BooleanQuery"

newtype JBooleanQuery
  = JBooleanQuery (J T)

instance Coercible JBooleanQuery T

instance JReference JBooleanQuery where
  type JTy JBooleanQuery = T

instance Subclass JBooleanQuery where
  type Super JBooleanQuery = JQuery

instance Implements1 JBooleanQuery JIterable JBooleanClause