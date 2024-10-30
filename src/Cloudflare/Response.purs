module Cloudflare.Response where

import Data.ArrayBuffer.Types (ArrayBuffer)

import Promise.Aff (Promise)

import Web.Fetch.Headers (Headers)
import Web.Streams.ReadableStream (ReadableStream)
import Web.XHR.FormData (FormData)

type Response =
  { body :: ReadableStream {} -- TODO: undefined
  , bodyUsed :: Boolean
  , headers :: Headers
  , ok :: Boolean
  , redirected :: Boolean
  , status :: Number
  , statusText :: String
  , url :: String
  , webSocket :: {} -- TODO: undefined
  }

new :: String -> Response
new = constructor

foreign import constructor :: String -> Response

foreign import clone :: Response -> Response
foreign import json :: Response -> Response
foreign import redirect :: Response -> Response

foreign import arrayBuffer :: Response -> Promise ArrayBuffer
foreign import formData :: Response -> Promise FormData
foreign import text :: Response -> Promise String
