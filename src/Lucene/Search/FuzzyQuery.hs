-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html

module Lucene.Search.FuzzyQuery
  ( JFuzzyQuery
  , defaultMaxEdits
  , defaultMaxExpansions
  , defaultPrefixLength
  , defaultTranspositions
  , new
  ) where

import Lucene.Index.Term (JTerm)
import Lucene.Search.MultiTermQuery (JMultiTermQuery)

import Data.Int (Int32)
import Language.Java.Extra hiding (new)
import System.IO.Unsafe (unsafeDupablePerformIO)

import qualified Language.Java.Extra as Java

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html
type JFuzzyQuery
  = J ('Class "org.apache.lucene.search.FuzzyQuery")

instance Reference JFuzzyQuery

instance Subclass JFuzzyQuery where
  type Super JFuzzyQuery = JMultiTermQuery

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html#defaultMaxEdits
defaultMaxEdits :: Int32
defaultMaxEdits = unsafeDupablePerformIO
  (getStaticField "org.apache.lucene.search.FuzzyQuery" "defaultMaxEdits")

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html#defaultMaxExpansions
defaultMaxExpansions :: Int32
defaultMaxExpansions = unsafeDupablePerformIO
  (getStaticField "org.apache.lucene.search.FuzzyQuery" "defaultMaxExpansions")

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html#defaultPrefixLength
defaultPrefixLength :: Int32
defaultPrefixLength = unsafeDupablePerformIO
  (getStaticField "org.apache.lucene.search.FuzzyQuery" "defaultPrefixLength")

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html#defaultTranspositions
defaultTranspositions :: Bool
defaultTranspositions = unsafeDupablePerformIO
  (getStaticField "org.apache.lucene.search.FuzzyQuery" "defaultTranspositions")

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/FuzzyQuery.html#FuzzyQuery-org.apache.lucene.index.Term-int-int-int-boolean-
new :: JTerm -> Int32 -> Int32 -> Int32 -> Bool -> IO JFuzzyQuery
new a b c d e = Java.new [jvalue a, jvalue b, jvalue c, jvalue d, jvalue e]
