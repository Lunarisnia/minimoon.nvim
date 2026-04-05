--[[ 
This is the config main entry point
]]
--

require("config.global-defaults")
require("keybindings.global-bindings")

-- TODO: Make indentation smaller

-- Initiate lazy package manager
require("config.lazy")
