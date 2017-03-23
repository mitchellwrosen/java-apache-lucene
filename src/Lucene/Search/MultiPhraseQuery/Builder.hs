-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/MultiPhraseQuery.Builder.html

module Lucene.Search.MultiPhraseQuery.Builder
  ( JMultiPhraseQueryBuilder
  , new
  , add
  , build
  ) where

import Lucene.Index.Term (JTerm)
import Lucene.Search.MultiPhraseQuery (JMultiPhraseQuery)

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

type JMultiPhraseQueryBuilder
  = J ('Class "org.apache.lucene.search.MultiPhraseQuery$Builder")

instance Reference JMultiPhraseQueryBuilder

-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/MultiPhraseQuery.Builder.html#Builder--
new :: IO JMultiPhraseQueryBuilder
new = Java.new []

-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/MultiPhraseQuery.Builder.html#add-org.apache.lucene.index.Term-
add
  :: IsA self JMultiPhraseQueryBuilder
  => self -> JTerm -> IO JMultiPhraseQueryBuilder
add self term = call self "add" [jvalue term]

build :: IsA self JMultiPhraseQueryBuilder => self -> IO JMultiPhraseQuery
build self = call self "build" []
