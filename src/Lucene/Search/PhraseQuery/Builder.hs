-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.Builder.html

module Lucene.Search.PhraseQuery.Builder
  ( JPhraseQueryBuilder
  , new
  , add
  , add2
  , build
  ) where

import Lucene.Index.Term (JTerm)
import Lucene.Search.PhraseQuery (JPhraseQuery)

import Data.Int (Int32)
import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.Builder.html
type JPhraseQueryBuilder
  = J ('Class "org.apache.lucene.search.PhraseQuery$Builder")

instance Reference JPhraseQueryBuilder

instance Subclass JPhraseQueryBuilder where
  type Super JPhraseQueryBuilder = JObject

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.Builder.html#Builder--
new :: IO JPhraseQueryBuilder
new = Java.new []

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.Builder.html#add-org.apache.lucene.index.Term-
add :: JPhraseQueryBuilder -> JTerm -> IO JPhraseQueryBuilder
add self term = call self "add" [jvalue term]

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.Builder.html#add-org.apache.lucene.index.Term-int-
add2 :: JPhraseQueryBuilder -> JTerm -> Int32 -> IO JPhraseQueryBuilder
add2 self term i = call self "add" [jvalue term, jvalue i]

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PhraseQuery.Builder.html#build--
build :: JPhraseQueryBuilder -> IO JPhraseQuery
build self = call self "build" []
