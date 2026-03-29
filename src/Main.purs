module Main where

import Prelude

import Cloudflare.Request (Request)
import Cloudflare.Request as Request
import Cloudflare.Response (Response)
import Cloudflare.Response as Response

import Control.Monad.Reader (Reader, local, asks)

import Effect (Effect)
import Effect.Aff (Aff)

import Promise.Aff (Promise)
import Promise.Aff as Promise

type Environment = { }
type Context = { }

fetch :: Request -> Environment -> Context -> Effect (Promise Response)
fetch request environment context = Promise.fromAff $ fetchAff request environment context

type FetchReader = Reader { request :: Request, environment :: Environment, context :: Context }

fetchAff :: FetchReader (Aff Response)
fetchAff = ado
    request <- asks (\x -> x.request)
    body <- Promise.toAff $ Request.json request
    fetchAffTyped body.type

-- fetchAffTyped :: Int -> FetchReader (Aff Response)
-- fetchAffTyped 1 = do
--     pure $ Response.new "Hello, World!"
--
-- router :: String -> String -> Unit
-- router "/" "POST" =
--
-- checkPath :: Request -> Unit
-- checkPath request = if
--     let path = Request.url.path request
--     if path /= "/" then
--         Response.new ""
--     else
--         Response.new ""
--
