-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/AutomatonQuery.html

module Lucene.Search.AutomatonQuery
  ( JAutomatonQuery
  ) where

import Lucene.Search.MultiTermQuery (JMultiTermQuery)

import Language.Java.Extra

-- http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/AutomatonQuery.html
type JAutomatonQuery
  = J ('Class "org.apache.lucene.search.AutomatonQuery")

instance Reference JAutomatonQuery

instance Subclass JAutomatonQuery where
  type Super JAutomatonQuery = JMultiTermQuery
