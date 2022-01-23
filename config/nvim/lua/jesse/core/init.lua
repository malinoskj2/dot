-- Core
local List = require "pl.List"

local modules = List {
  "jesse.core.general",
  "jesse.core.performance",
  "jesse.core.util",
  "jesse.core.tab",
}

modules:foreach(function(module)
  require(module)
end)
