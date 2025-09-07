--  ██████  ██████  ██   ██ ██████  █████   █████  ██████  █████  ██████
-- ██░░░░  ██░░░░██░██  ░██░░██░░████░░░██ ██░░░██░░██░░████░░░██░░██░░██
-- ░░█████ ░██   ░██░██  ░██ ░██ ░░░██  ░░ ░███████ ░██ ░░░███████ ░██ ░░
--  ░░░░░██░██   ░██░██  ░██ ░██   ░██   ██░██░░░░  ░██   ░██░░░░  ░██
--  ██████ ░░██████ ░░██████░███   ░░█████ ░░██████░███   ░░██████░███
-- ░░░░░░   ░░░░░░   ░░░░░░ ░░░     ░░░░░   ░░░░░░ ░░░     ░░░░░░ ░░░
--  r  e  a  d     c  o  d  e     l  i  k  e     a     w  i  z  a  r  d
--
-- sourcerer by xero harrison (http://sourcerer.xero.nu)
--  ├─ based on sorcerer by Jeet Sukumaran (http://jeetworks.org)
--  └─ based on mustang by Henrique C. Alves (hcarvalhoalves@gmail.com)
-- Exact 1:1 port to Lua for Neovim

vim.cmd("set background=dark")
vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "sourcerer"

-- Helper function to set highlights
local function hi(name, opts)
	vim.api.nvim_set_hl(0, name, opts)
end

--  █▓▒░ GUI colors (exact match from .vim)
hi("Normal", { fg = "#c2c2b0", bg = "#222222", ctermfg = 145, ctermbg = nil })
hi("ColorColumn", { bg = "#1c1c1c", ctermbg = 16 })
hi("Cursor", { bg = "#626262", ctermbg = 241 })
hi("CursorColumn", { bg = "#2d2d2d", ctermbg = 16 })
hi("CursorLine", { bg = "#2d2d2d", ctermbg = 236 })
hi("DiffAdd", { fg = "#000000", bg = "#3cb371", ctermfg = 16, ctermbg = 71 })
hi("DiffDelete", { fg = "#000000", bg = "#aa4450", ctermfg = 16, ctermbg = 124 })
hi("DiffChange", { fg = "#000000", bg = "#4f94cd", ctermfg = 16, ctermbg = 68 })
hi("DiffText", { fg = "#000000", bg = "#8ee5ee", ctermfg = 16, ctermbg = 117 })
hi("Directory", { fg = "#1e90ff", ctermfg = 33, ctermbg = 234 })
hi("ErrorMsg", { fg = "#ff6a6a", bold = true, ctermfg = 203 })
hi("FoldColumn", { fg = "#68838b", bg = "#4B4B4B", bold = true, ctermfg = 66, ctermbg = 239 })
hi("Folded", { fg = "#406060", bg = "#232c2c", ctermfg = 60, ctermbg = 16 })
hi("IncSearch", { fg = "#ffffff", bg = "#ff4500", bold = true, ctermfg = 231, ctermbg = 202 })
hi("LineNr", { fg = "#878787", bg = "#3A3A3A", ctermfg = 102, ctermbg = 237 })
hi("MatchParen", { fg = "#fff000", bold = true, ctermfg = 226 })
hi("ModeMsg", { fg = "#afafaf", bg = "#222222", bold = true, ctermfg = 145 })
hi("MoreMsg", { fg = "#2e8b57", bold = true, ctermfg = 29, ctermbg = 234 })
hi("NonText", { fg = "#404050", ctermfg = 59 })

-- completions (exact match)
hi("Pmenu", { fg = "#A8A8A8", bg = "#3A3A3A", ctermfg = 248, ctermbg = 237 })
hi("PmenuSel", { fg = "#000000", bg = "#528B8B", ctermfg = 16, ctermbg = 66 })
hi("PmenuSbar", { fg = "#000000", bg = "#528B8B", ctermfg = 16, ctermbg = 66 })
hi("PmenuThumb", { fg = "#000000", bg = "#528B8B", ctermfg = 16, ctermbg = 66, reverse = true })

hi("Question", { fg = "#00ee00", bold = true, ctermfg = 46 })
hi("Search", { fg = "#000000", bg = "#d6e770", bold = true, ctermfg = 16, ctermbg = 185 })
hi("SignColumn", { fg = "#ffffff", ctermfg = 231 })
hi("SpecialKey", { fg = "#505060", ctermfg = 59 })
hi("SpellBad", { sp = "#ee2c2c", undercurl = true, ctermfg = 196 })
hi("SpellCap", { sp = "#0000ff", undercurl = true, ctermfg = 21 })
hi("SpellLocal", { sp = "#008b8b", undercurl = true, ctermfg = 30 })
hi("SpellRare", { sp = "#ff00ff", undercurl = true, ctermfg = 201 })
hi("StatusLine", { fg = "#000000", bg = "#808070", bold = true, ctermfg = 16, ctermbg = 101 })
hi("StatusLineNC", { fg = "#000000", bg = "#404c4c", italic = true, ctermfg = 16, ctermbg = 102 })
hi("VertSplit", { fg = "#404c4c", bg = "#404c4c", ctermfg = 102, ctermbg = 102 })
hi("TabLine", { underline = true, ctermfg = 16, ctermbg = 102, bold = true })
hi("TabLineFill", { reverse = true, ctermfg = 16, ctermbg = 102 })
hi("TabLineSel", { bold = true, ctermfg = 59, ctermbg = 16 })
hi("Title", { fg = "#528b8b", bold = true, ctermfg = 66 })
hi("Visual", { fg = "#000000", bg = "#6688aa", ctermfg = 16, ctermbg = 67 })
hi("WarningMsg", { fg = "#ee9a00", ctermfg = 208, ctermbg = 234 })
hi("WildMenu", { fg = "#000000", bg = "#87ceeb", ctermfg = 16, ctermbg = 116 })
hi("ExtraWhitespace", { bg = "#528b8b", ctermbg = 66 })

--  syntax highlighting (exact match)
hi("Comment", { fg = "#686858", italic = true, ctermfg = 59 })
hi("Boolean", { fg = "#ff9800", ctermfg = 208 })
hi("String", { fg = "#779b70", ctermfg = 101 })
hi("Identifier", { fg = "#9ebac2", ctermfg = 145 })
hi("Function", { fg = "#faf4c6", ctermfg = 230 })
hi("Type", { fg = "#7e8aa2", ctermfg = 103 })
hi("Statement", { fg = "#90b0d1", ctermfg = 110 })
hi("Keyword", { fg = "#90b0d1", ctermfg = 110 })
hi("Constant", { fg = "#ff9800", ctermfg = 208 })
hi("Number", { fg = "#cc8800", ctermfg = 172 })
hi("Special", { fg = "#719611", ctermfg = 64 })
hi("PreProc", { fg = "#528b8b", ctermfg = 66 })
hi(
	"Todo",
	{ fg = "#8f6f8f", bg = "#202020", italic = true, underline = true, bold = true, ctermfg = 96, ctermbg = 234 }
)

-- diff (exact match)
hi("diffOldFile", { fg = "#88afcb", italic = true, ctermfg = 67 })
hi("diffNewFile", { fg = "#88afcb", italic = true, ctermfg = 67 })
hi("diffFile", { fg = "#88afcb", italic = true, ctermfg = 67 })
hi("diffLine", { fg = "#88afcb", italic = true, ctermfg = 67 })
hi("diffAdded", { fg = "#3cb371", ctermfg = 71 })
hi("diffRemoved", { fg = "#aa4450", ctermfg = 124 })
hi("diffChanged", { fg = "#4f94cd", ctermfg = 68 })

-- Links (exact from .vim)
hi("diffSubname", { link = "diffLine" })
hi("diffOnly", { link = "Constant" })
hi("diffIdentical", { link = "Constant" })
hi("diffDiffer", { link = "Constant" })
hi("diffBDiffer", { link = "Constant" })
hi("diffIsA", { link = "Constant" })
hi("diffNoEOL", { link = "Constant" })
hi("diffCommon", { link = "Constant" })
hi("diffComment", { link = "Constant" })

-- python (exact match)
hi("pythonException", { fg = "#90b0d1", ctermfg = 110 })
hi("pythonExClass", { fg = "#996666", ctermfg = 95 })
hi("pythonDecorator", { fg = "#888555", ctermfg = 101 })
hi("pythonDecoratorFunction", { link = "pythonDecorator" })

-- Additional python highlights from 256 color section (exact match)
hi("pythonClass", {})
hi("pythonFunc", {})
hi("pythonFuncParams", {})
hi("pythonKeyword", {})
hi("pythonParam", {})
hi("pythonRawEscape", {})
hi("pythonSuperclasses", {})
hi("pythonSync", {})

-- Additional highlights from 256 color section (exact match)
hi("Conceal", { fg = "#252525", bg = "#248248", ctermfg = 252, ctermbg = 248 })
hi("Error", { fg = "#ffffff", bg = "#ff0000", ctermfg = 231, ctermbg = 196 })
hi("Ignore", { fg = "#234234", ctermfg = 234 })
hi("InsertModeCursorLine", { bg = "#16161d", ctermbg = 16 })
hi("NormalModeCursorLine", { bg = "#235235", ctermbg = 235 })
hi("StatusLineAlert", { fg = "#ffffff", bg = "#ce4e4e", ctermfg = 231, ctermbg = 160 })
hi("StatusLineUnalert", { fg = "#909090", bg = "#262626", ctermfg = 144, ctermbg = 238 })
hi("Test", {})
hi("Underlined", { fg = "#6f6fff", underline = true, ctermfg = 111 })
hi("VisualNOS", { bold = true, underline = true })
hi("cCursor", { reverse = true })
hi("iCursor", { fg = "#000000", bg = "#d2d2d2", ctermfg = 16, ctermbg = 210 })
hi("lCursor", { fg = "#234234", bg = "#919191", ctermfg = 234, ctermbg = 145 })
hi("nCursor", { fg = "#145145", ctermfg = 145 })
hi("vCursor", { fg = "#000000", bg = "#c9c9c9", ctermfg = 16, ctermbg = 201 })

-- LSP and modern Neovim features using sourcerer color palette
-- Using exact colors from the sourcerer palette for consistency
hi("DiagnosticError", { fg = "#ff6a6a" }) -- Same as ErrorMsg
hi("DiagnosticWarn", { fg = "#ee9a00" }) -- Same as WarningMsg
hi("DiagnosticInfo", { fg = "#1e90ff" }) -- Same as Directory
hi("DiagnosticHint", { fg = "#2e8b57" }) -- Same as MoreMsg

hi("DiagnosticUnderlineError", { sp = "#ff6a6a", undercurl = true })
hi("DiagnosticUnderlineWarn", { sp = "#ee9a00", undercurl = true })
hi("DiagnosticUnderlineInfo", { sp = "#1e90ff", undercurl = true })
hi("DiagnosticUnderlineHint", { sp = "#2e8b57", undercurl = true })

hi("DiagnosticVirtualTextError", { fg = "#ff6a6a", bg = "#2d2222" })
hi("DiagnosticVirtualTextWarn", { fg = "#ee9a00", bg = "#2d2d22" })
hi("DiagnosticVirtualTextInfo", { fg = "#1e90ff", bg = "#22222d" })
hi("DiagnosticVirtualTextHint", { fg = "#2e8b57", bg = "#222d22" })

-- Neovim floating windows using sourcerer palette
hi("NormalFloat", { fg = "#c2c2b0", bg = "#3A3A3A" }) -- Same as Pmenu bg
hi("FloatBorder", { fg = "#528B8B", bg = "#3A3A3A" }) -- Same as PreProc

-- WinSeparator (Neovim 0.7+) - same as VertSplit
hi("WinSeparator", { fg = "#404c4c", bg = "#404c4c" })

-- Treesitter highlights using exact sourcerer colors
hi("@comment", { link = "Comment" })
hi("@constant", { link = "Constant" })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@function", { link = "Function" })
hi("@keyword", { link = "Keyword" })
hi("@type", { link = "Type" })
hi("@variable", { fg = "#c2c2b0" }) -- Same as Normal
hi("@punctuation", { fg = "#c2c2b0" })

-- Plugin support using sourcerer palette
-- GitSigns
hi("GitSignsAdd", { fg = "#3cb371" }) -- Same as DiffAdd
hi("GitSignsChange", { fg = "#4f94cd" }) -- Same as DiffChange
hi("GitSignsDelete", { fg = "#aa4450" }) -- Same as DiffDelete

-- Telescope
hi("TelescopeNormal", { fg = "#c2c2b0", bg = "#222222" })
hi("TelescopeBorder", { fg = "#528B8B" })
hi("TelescopeSelection", { fg = "#c2c2b0", bg = "#2d2d2d" })
hi("TelescopeSelectionCaret", { fg = "#fff000" }) -- Same as MatchParen
hi("TelescopeMatching", { fg = "#fff000", bold = true })

-- nvim-cmp
hi("CmpItemAbbrMatch", { fg = "#fff000", bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = "#fff000", bold = true })
hi("CmpItemKind", { fg = "#7e8aa2" }) -- Same as Type
hi("CmpItemMenu", { fg = "#686858" }) -- Same as Comment
