-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html

module Lucene.Search.BooleanClause.Occur
  ( JBooleanClauseOccur(..)
  , pattern FILTER
  , pattern MUST
  , pattern MUST_NOT
  , pattern SHOULD
  ) where

import Java.IO.Serializable (JSerializable)
import Java.Lang.Enum (JEnum)
import Java.Lang.Comparable (JComparable)
import Language.Java.Extra

import System.IO.Unsafe (unsafeDupablePerformIO)

type JBooleanClauseOccur
  = J ('Class "org.apache.lucene.search.BooleanClause$Occur")

instance Reference JBooleanClauseOccur

instance Subclass JBooleanClauseOccur where
  type Super JBooleanClauseOccur = JEnum JBooleanClauseOccur

instance Implements JBooleanClauseOccur JSerializable

instance Implements1 JBooleanClauseOccur JComparable JBooleanClauseOccur

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#FILTER
pattern FILTER :: JBooleanClauseOccur
pattern FILTER <- _FILTER where
  FILTER = _FILTER

-- http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#MUST
pattern MUST :: JBooleanClauseOccur
pattern MUST <- _MUST where
  MUST = _MUST

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#MUST_NOT
pattern MUST_NOT :: JBooleanClauseOccur
pattern MUST_NOT <- _MUST_NOT where
  MUST_NOT = _MUST_NOT

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#SHOULD
pattern SHOULD :: JBooleanClauseOccur
pattern SHOULD <- _SHOULD where
  SHOULD = _SHOULD

_FILTER :: JBooleanClauseOccur
_FILTER =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "FILTER")

_MUST :: JBooleanClauseOccur
_MUST =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "MUST")

_MUST_NOT :: JBooleanClauseOccur
_MUST_NOT =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "MUST_NOT")

_SHOULD :: JBooleanClauseOccur
_SHOULD =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "SHOULD")
