-- Mapping
local List = require "pl.List"

local modules = List {
  "jesse.mapping.core",
}

modules:foreach(function(module)
  require(module)
end)
