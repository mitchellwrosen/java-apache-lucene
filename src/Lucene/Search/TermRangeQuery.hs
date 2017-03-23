module Lucene.Search.TermRangeQuery
  ( JTermRangeQuery
  , new
  ) where

import Lucene.Search.Query (JQuery)
import Lucene.Util.BytesRef (JBytesRef)

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | https://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/TermRangeQuery.html
type JTermRangeQuery
  = J ('Class "org.apache.lucene.search.TermRangeQuery")

instance Reference JTermRangeQuery

instance Subclass JTermRangeQuery where
  type Super JTermRangeQuery = JQuery

new :: JString -> JBytesRef -> JBytesRef -> Bool -> Bool -> IO JTermRangeQuery
new field lower upper bl bu =
  Java.new [jvalue field, jvalue lower, jvalue upper, jvalue bl, jvalue bu]
