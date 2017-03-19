-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.html

module Lucene.Search.PhraseQuery
  ( JPhraseQuery
  ) where

import Lucene.Search.Query (JQuery)

import Language.Java.Extra

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.html
type JPhraseQuery
  = J ('Class "org.apache.lucene.search.PhraseQuery")

instance Reference JPhraseQuery

instance Subclass JPhraseQuery where
  type Super JPhraseQuery = JQuery
