-- | This is the entry point to the game, and contains the main game logic.
module Main where
  import Prelude(Unit)

  import Control.Monad.Eff(Eff())
  import Data.Either(Either(..))

  import Data.Semigroup((<>))

  import Game.State (State)
  import Game.Input (Input(Drop, Take, Look), parse)
  import Game.Driver (GAME, Game, runGame)

  myGame :: Game State Input
  myGame = { initial: initial, describe: describe, parse: parse, update: update }
    where
      -- EXERCISE SET 4 (1/2)
      -- Add initial values to the newly-added fields in State:
      initial :: State
      initial = {}

      -- EXERCISE SET 4 (2/2)
      -- Describe the player's status and (optionally) stats.
      describe :: State -> String
      describe s = "You are standing no where, with nothing around"

      update :: State -> Input -> Either String State
      update s Look = Right s
      update s (Take v) = Left ("There is no " <> v <> " to take!")
      update s (Drop v) = Left ("You are not carrying a " <> v <> "!")

  main :: Eff ( game :: GAME ) Unit
  main = runGame myGame
