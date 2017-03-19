-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/TermQuery.html

module Lucene.Search.TermQuery where

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

import Lucene.Index.Term (JTerm)
import Lucene.Search.Query (JQuery)

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/TermQuery.html
type JTermQuery
  = J ('Class "org.apache.lucene.search.TermQuery")

instance Reference JTermQuery

instance Subclass JTermQuery where
  type Super JTermQuery = JQuery

new :: JTerm -> IO JTermQuery
new term = Java.new [coerce term]
