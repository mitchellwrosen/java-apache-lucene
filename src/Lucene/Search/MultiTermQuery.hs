-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/MultiTermQuery.html

module Lucene.Search.MultiTermQuery
  ( JMultiTermQuery
  , new
  ) where

import Lucene.Search.Query (JQuery)

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/MultiTermQuery.html
type JMultiTermQuery
  = J ('Class "org.apache.lucene.search.MultiTermQuery")

instance Reference JMultiTermQuery

instance Subclass JMultiTermQuery where
  type Super JMultiTermQuery = JQuery

new :: JString -> IO JMultiTermQuery
new field = Java.new [jvalue field]
