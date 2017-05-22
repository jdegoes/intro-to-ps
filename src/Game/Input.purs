-- | This is the module responsible for parsing user input, and converting input
-- | into data types that are easier to work with than raw strings.
-- |
-- | You can add more commands to the game here.
module Game.Input
  ( Input(..)
  , parse
  ) where

  import Prelude (Unit, ($), (<*>), pure, (==), bind, void, (<<<))
  import Data.Semigroup((<>))
  import Data.Either(Either(..))

  import Control.Alt((<|>))
  import Control.Apply((<*), (*>))

  import Data.Char as C
  import Data.String(fromCharArray)

  import Text.Parsing.StringParser (Parser, ParseError(ParseError), runParser)
  import Text.Parsing.StringParser.Combinators (optional, many1)
  import Text.Parsing.StringParser.String (eof, anyChar, string)

  data Input
    = Look          -- Look around wherever the player is standing
    | Take String   -- Take the specified item from the environment
    | Drop String   -- Drop the specified item onto the environment

  trailingWs :: Parser Unit
  trailingWs = void <<< many1 $ string " "

  command :: forall a. String -> a -> Parser a
  command t a = string t *> (trailingWs <|> eof) *> pure a

  word :: Parser String
  word = go "" <* (optional trailingWs) where
    go v = eof *> pure v <|> do
      char <- anyChar
      if char == ' ' then pure v else go (v <> fromCharArray [char])

  input :: Parser Input
  input = (look <|> take <|> drop) <* eof
    where
      look = command "look" Look

      take = command "take" Take <*> word

      drop = command "drop" Drop <*> word

  parse :: String -> Either String Input
  parse s = case runParser input s of
        Left (ParseError e) -> Left $ e
        Right i             -> Right i
