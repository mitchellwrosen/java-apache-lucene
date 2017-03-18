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

type T
  = 'Class "org.apache.lucene.search.BooleanClause$Occur"

newtype JBooleanClauseOccur
  = JBooleanClauseOccur (J T)

instance Coercible JBooleanClauseOccur T

instance JReference JBooleanClauseOccur where
  type JTy JBooleanClauseOccur = T

instance Subclass JBooleanClauseOccur where
  type Super JBooleanClauseOccur = JEnum JBooleanClauseOccur

instance Implements JBooleanClauseOccur JSerializable

instance Implements1 JBooleanClauseOccur JComparable JBooleanClauseOccur


pattern FILTER :: JBooleanClauseOccur
pattern FILTER <- _FILTER where
  FILTER = _FILTER

pattern MUST :: JBooleanClauseOccur
pattern MUST <- _MUST where
  MUST = _MUST

pattern MUST_NOT :: JBooleanClauseOccur
pattern MUST_NOT <- _MUST_NOT where
  MUST_NOT = _MUST_NOT

pattern SHOULD :: JBooleanClauseOccur
pattern SHOULD <- _SHOULD where
  SHOULD = _SHOULD

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#FILTER
_FILTER :: JBooleanClauseOccur
_FILTER =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "FILTER")

-- http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#MUST
_MUST :: JBooleanClauseOccur
_MUST =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "MUST")

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#MUST_NOT
_MUST_NOT :: JBooleanClauseOccur
_MUST_NOT =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "MUST_NOT")

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/search/BooleanClause.Occur.html#SHOULD
_SHOULD :: JBooleanClauseOccur
_SHOULD =
  unsafeDupablePerformIO
    (getStaticField "org.apache.lucene.search.BooleanClause$Occur" "SHOULD")
