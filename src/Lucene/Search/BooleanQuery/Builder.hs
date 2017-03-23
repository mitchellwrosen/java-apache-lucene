-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanQuery.Builder.html

module Lucene.Search.BooleanQuery.Builder
  ( JBooleanQueryBuilder
  , new
  , add
  , build
  ) where

import Language.Java.Extra hiding (new)
import Lucene.Search.Query (JQuery)
import Lucene.Search.BooleanQuery (JBooleanQuery)
import Lucene.Search.BooleanClause.Occur

import qualified Language.Java.Extra as Java

type JBooleanQueryBuilder
  = J ('Class "org.apache.lucene.search.BooleanQuery$Builder")

instance Reference JBooleanQueryBuilder

instance Subclass JBooleanQueryBuilder where
  type Super JBooleanQueryBuilder = JObject

new :: IO JBooleanQueryBuilder
new = Java.new []

add
  :: (IsA query JQuery, IsA self JBooleanQueryBuilder)
  => self -> query -> JBooleanClauseOccur
  -> IO JBooleanQueryBuilder
add self query occur =
  call self "add" [jvalue (upcast query :: JQuery), jvalue occur]

build :: IsA self JBooleanQueryBuilder => self -> IO JBooleanQuery
build self = call self "build" []
