module Cloudflare.Request where

import Data.ArrayBuffer.Types (ArrayBuffer)
import Data.Nullable (Nullable)

import Promise.Aff (Promise)

import Web.Fetch.Headers (Headers)
import Web.Streams.ReadableStream (ReadableStream)
import Web.XHR.FormData (FormData)

type Request =
  { body :: ReadableStream {} -- TODO: undefined
  , bodyUsed :: Boolean
  , cf :: IncomingRequestCfProperties
  , headers :: Headers
  , method :: String
  , redirect :: String
  , url :: String
  }

type IncomingRequestCfProperties =
  { asn :: Number
  , asOrganization :: String
  , botManagement :: Nullable {} -- TODO: undefined
  , clientAcceptEncoding :: Nullable String
  , colo :: String
  , country :: Nullable String
  , isEUCountry :: Nullable String
  , httpProtocol :: String
  , requestPriority :: Nullable String
  , tlsCipher :: String
  , tlsClientAuth :: Nullable {} -- TODO: undefined
  , tlsClientHelloLength :: String
  , tlsClientRandom :: String
  , tlsVersion :: String
  , city :: Nullable String
  , continent :: Nullable String
  , latitude :: Nullable String
  , longitude :: Nullable String
  , postalCode :: Nullable String
  , metroCode :: Nullable String
  , region :: Nullable String
  , regionCode :: Nullable String
  , timezone :: String
  }

foreign import clone :: Request -> Promise Request
foreign import arrayBuffer :: Request -> Promise ArrayBuffer
foreign import formData :: Request -> Promise FormData
foreign import json :: forall a. Request -> Promise a
foreign import text :: Request -> Promise String
