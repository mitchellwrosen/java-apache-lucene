-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/WildcardQuery.html

module Lucene.Search.WildcardQuery
  ( JWildcardQuery
  , new
  ) where

import Lucene.Index.Term (JTerm)
import Lucene.Search.AutomatonQuery (JAutomatonQuery)

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/WildcardQuery.html
type JWildcardQuery
  = J ('Class "org.apache.lucene.search.WildcardQuery")

instance Reference JWildcardQuery

instance Subclass JWildcardQuery where
  type Super JWildcardQuery = JAutomatonQuery

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/WildcardQuery.html#WildcardQuery-org.apache.lucene.index.Term-
new :: JTerm -> IO JWildcardQuery
new term = Java.new [jvalue term]
