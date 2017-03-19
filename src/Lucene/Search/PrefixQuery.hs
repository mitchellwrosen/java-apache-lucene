-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PrefixQuery.html

module Lucene.Search.PrefixQuery
  ( JPrefixQuery
  , new
  ) where

import Lucene.Index.Term (JTerm)
import Lucene.Search.AutomatonQuery (JAutomatonQuery)

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PrefixQuery.html
type JPrefixQuery
  = J ('Class "org.apache.lucene.search.PrefixQuery")

instance Reference JPrefixQuery

instance Subclass JPrefixQuery where
  type Super JPrefixQuery = JAutomatonQuery

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/PrefixQuery.html#PrefixQuery-org.apache.lucene.index.Term-
new :: JTerm -> IO JPrefixQuery
new term = Java.new [jvalue term]
