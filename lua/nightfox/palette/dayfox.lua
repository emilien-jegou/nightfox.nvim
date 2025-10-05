local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

local meta = {
  name = "dayfox",
  light = true,
}

local bg = C("#fffbf7")
local fg = C("#33234d")

-- stylua: ignore
local palette = {
  black   = Shade.new("#2b241e", 0.15, -0.15, true),
  red     = Shade.new("#961a26", 0.15, -0.15, true),
  green   = Shade.new("#266338", 0.15, -0.15, true),
  yellow  = Shade.new("#a65000", 0.15, -0.15, true),
  blue    = Shade.new("#1f42ad", 0.15, -0.15, true),
  magenta = Shade.new("#6028bd", 0.15, -0.15, true),
  cyan    = Shade.new("#1b6970", 0.15, -0.15, true),
  white   = Shade.new("#f2e9e1", 0.15, -0.15, true),
  orange  = Shade.new("#8f3d40", 0.15, -0.15, true),
  pink    = Shade.new("#ad3497", 0.15, -0.15, true),

  comment = bg:blend(fg, 0.4):to_css(),

  bg0     = bg:darken(-4):to_css(), -- Dark bg (status line and float)
  bg1     = bg:to_css(), -- Default bg
  bg2     = bg:darken(6):to_css(), -- Lighter bg (colorcolm folds)
  bg3     = bg:darken(12):to_css(), -- Lighter bg (cursor line)
  bg4     = bg:darken(24):to_css(), -- Conceal, border fg

  fg0     = fg:brighten(6):to_css(), -- Lighter fg
  fg1     = fg:to_css(), -- Default fg
  fg2     = fg:brighten(-24):to_css(), -- Darker fg (status line)
  fg3     = fg:brighten(-48):to_css(), -- Darker fg (line numbers, fold colums)

  sel0    = "#e7d2be", -- Popup bg, visual selection bg
  sel1    = "#a4c1c2", -- Popup sel bg, search bg
}

local function generate_spec(pal)
  -- stylua: ignore start
  local spec = {
    bg0  = pal.bg0,  -- Dark bg (status line and float)
    bg1  = pal.bg1,  -- Default bg
    bg2  = pal.bg2,  -- Lighter bg (colorcolm folds)
    bg3  = pal.bg3,  -- Lighter bg (cursor line)
    bg4  = pal.bg4,  -- Conceal, border fg

    fg0  = pal.fg0,  -- Lighter fg
    fg1  = pal.fg1,  -- Default fg
    fg2  = pal.fg2,  -- Darker fg (status line)
    fg3  = pal.fg3,  -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.syntax = {
    bracket     = spec.fg2,         -- Brackets and Punctuation
    builtin0    = pal.red.base,     -- Builtin variable
    builtin1    = pal.cyan.dim,     -- Builtin type
    builtin2    = pal.orange.dim,   -- Builtin const
    builtin3    = pal.red.dim,      -- Not used
    comment     = pal.comment,      -- Comment
    conditional = pal.magenta.dim,  -- Conditional and loop
    const       = pal.orange.dim,   -- Constants, imports and booleans
    dep         = spec.fg3,         -- Deprecated
    field       = pal.blue.base,    -- Field
    func        = pal.blue.dim,     -- Functions and Titles
    ident       = pal.cyan.base,    -- Identifiers
    keyword     = pal.magenta.base, -- Keywords
    number      = pal.orange.base,  -- Numbers
    operator    = spec.fg2,         -- Operators
    preproc     = pal.pink.dim,     -- PreProc
    regex       = pal.yellow.dim,   -- Regex
    statement   = pal.magenta.base, -- Statements
    string      = pal.green.base,   -- Strings
    type        = pal.yellow.base,  -- Types
    variable    = pal.black.base,   -- Variables
  }

  spec.diag = {
    error = pal.red.base,
    warn  = pal.yellow.base,
    info  = pal.blue.base,
    hint  = pal.green.base,
    ok    = pal.green.base,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.3):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.3):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.3):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.3):to_css(),
    ok    = C(spec.bg1):blend(C(spec.diag.ok), 0.3):to_css(),
  }

  spec.diff = {
    add    = C(spec.bg1):blend(C(pal.green.base), 0.2):to_css(),
    delete = C(spec.bg1):blend(C(pal.red.base), 0.2):to_css(),
    change = C(spec.bg1):blend(C(pal.blue.base), 0.2):to_css(),
    text   = C(spec.bg1):blend(C(pal.blue.base), 0.4):to_css(),
  }

  spec.git = {
    add      = pal.green.base,
    removed  = pal.red.base,
    changed  = pal.yellow.base,
    conflict = pal.orange.base,
    ignored  = pal.comment,
  }

  -- stylua: ignore start

  return spec
end

return { meta = meta, palette = palette, generate_spec = generate_spec }
