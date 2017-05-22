-- | This is a low-level module that defines what a game is and how to run it.
-- | It can handle any type of game, as long as it fits the mold specified herein.
-- |
-- | You should not need to modify this file during the workshop.
module Game.Driver
  ( Game()
  , GAME()
  , runGame
  ) where

  import Prelude (Unit)
  import Control.Monad.Eff(Eff(), kind Effect)
  import Data.Function.Uncurried(Fn2(), runFn2)
  import Data.Either(Either(), either)
  
  foreign import data GAME :: Effect

  type Game s i = {
    initial  :: s,
    describe :: s -> String,
    parse    :: String -> Either String i,
    update   :: s -> i -> Either String s }

  runGame :: forall s i. Game s i -> Eff (game :: GAME) Unit
  runGame g = runFn2 _runGame either g

  foreign import _runGame :: forall s i. Fn2 (forall a b c. (a -> c) -> (b -> c) -> (Either a b) -> c) (Game s i) (Eff (game :: GAME) Unit)
