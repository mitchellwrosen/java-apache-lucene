-- | https://lucene.apache.org/core/6_4_2/core/index.html

module Lucene.Search.MultiPhraseQuery
  ( JMultiPhraseQuery
  ) where

import Lucene.Search.Query (JQuery)

import Language.Java.Extra

-- | https://lucene.apache.org/core/6_4_2/core/index.html
type JMultiPhraseQuery
  = J ('Class "org.apache.lucene.search.MultiPhraseQuery")

instance  Reference JMultiPhraseQuery

instance Subclass JMultiPhraseQuery where
  type Super JMultiPhraseQuery = JQuery
