module Config where

import IHP.Environment
import IHP.FrameworkConfig
import IHP.Prelude

config :: ConfigBuilder
config = do
  option Production
  option (AppHostname "blog.com")
  option (BaseUrl "https://blog.com")