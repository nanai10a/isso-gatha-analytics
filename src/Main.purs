module Main where

import Prelude

import Cloudflare.Request (Request)
import Cloudflare.Request as Request
import Cloudflare.Response (Response)
import Cloudflare.Response as Response

import Effect (Effect)
import Effect.Aff (Aff)

import Promise.Aff (Promise)
import Promise.Aff as Promise

type Environment = { }
type Context = { }

fetch :: Request -> Environment -> Context -> Effect (Promise Response)
fetch request environment context = Promise.fromAff $ fetchAff request environment context

fetchAff :: Request -> Environment -> Context -> Aff Response
fetchAff request environment context = do
    body <- Promise.toAff $ Request.text request
    pure $ Response.new body
