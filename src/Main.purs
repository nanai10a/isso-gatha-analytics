module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Promise.Aff as Promise
import Promise.Aff (Promise)
import Effect.Aff (Aff)

main :: Effect Unit
main = do
  log "🍝"

foreign import data Request :: Type
foreign import data Response :: Type

foreign import text :: Request -> (Promise String)

foreign import response :: String -> Response

type Environment = { }
type Context = { }

fetch :: Request -> Environment -> Context -> Effect (Promise Response)
fetch request environment context = Promise.fromAff (fetchAff request environment context)

fetchAff :: Request -> Environment -> Context -> (Aff Response)
fetchAff request environment context = do
  requestText <- Promise.toAff (text request)
  pure (response requestText)
