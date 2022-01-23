-- Plugin Mapping

local List = require "pl.List"

local modules = List {
  "jesse.mapping.plugin.general",
}

modules:foreach(function(module)
  require(module)
end)
