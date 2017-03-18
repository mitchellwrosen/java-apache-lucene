-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/index/Term.html

module Lucene.Index.Term
  ( JTerm(..)
  , new
  ) where

import Language.Java.Extra hiding (new)

import qualified Language.Java.Extra as Java

import Data.Text (Text)

type T
  = 'Class "org.apache.lucene.index.Term"

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/index/Term.html
newtype JTerm
  = JTerm (J T)

instance Coercible JTerm T

instance JReference JTerm where
  type JTy JTerm = T

instance Subclass JTerm where
  type Super JTerm = JObject

-- | http://lucene.apache.org/core/6_4_2/core/org/apache/lucene/index/Term.html#Term-java.lang.String-java.lang.String-
new :: Text -> Text -> IO JTerm
new field text = do
  field' <- reflect field
  text'  <- reflect text
  Java.new [coerce field', coerce text']
