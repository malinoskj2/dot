-- Mapping
local List = require "pl.List"

local modules = List {
  "jesse.mapping.general",
}

modules:foreach(function(module)
  require(module)
end)
