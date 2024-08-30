require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local function get_uv()
  local uv = vim.uv
  if uv == nil then
    uv = vim.loop
  end
  return uv
end

local function set_mac_mappings()
  -- Mac mappings mainly for floating term
  nomap({ "n", "t" }, "<M-h>")
  nomap({ "n", "t" }, "<M-v>")
  -- horizontal toggle
  map({ "n", "t" }, "˙", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
  end, { desc = "terminal new horizontal term" })
  -- vertial toggle
  map({ "n", "t" }, "√", function()
    require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
  end, { desc = "terminal toggleable vertical term" })
end

local function set_pc_mappings()
  -- PC/Linux Mappings. Different keyboards
  print "PC/Linux Mappings running here"
end

local function set_env_mappings()
  local uv = get_uv()
  local uname = uv.os_uname()
  if uname.sysname == "Darwin" then
    set_mac_mappings()
  else
    set_pc_mappings()
  end
end

set_env_mappings()
