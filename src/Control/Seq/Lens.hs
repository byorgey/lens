-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Seq.Lens
-- Copyright   :  (C) 2012 Edward Kmett
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Edward Kmett <ekmett@gmail.com>
-- Stability   :  provisional
-- Portability :  portable
--
-- A 'Fold' can be used to take the role of 'Foldable' in @Control.Seq@
----------------------------------------------------------------------------
module Control.Seq.Lens
  ( seqOf
  ) where

import Control.Lens
import Control.Seq

-- | Evaluate the elements targeted by a 'Lens', 'Traversal', 'Iso',
-- 'Getter' or 'Fold' according to the given strategy.
--
-- @'seqFoldable' = 'seqOf' 'folded'@
seqOf :: Getting [c] a b c d -> Strategy c -> Strategy a
seqOf l s = seqList s . toListOf l
{-# INLINE seqOf #-}
