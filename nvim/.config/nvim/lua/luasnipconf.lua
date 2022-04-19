local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})


-- ls.snippets = {
--   all = {
--     s("trigger", { t("Wow! Text!") })
--   },
--   lua = {
--     ls.parser.parse_snippet("test", "--this is $1 a test"),
--   },
-- }


ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	},{type = "autosnippets"}),
})

ls.add_snippets("lua", {
	s("test", fmt("local {} = require('{}')", { i(1), rep(1) })),
})


ls.add_snippets("all", {
	s("autotrigger", { t("autosnippet"), }), }, {
	type = "autosnippets",
	key = "all_auto",
})

ls.add_snippets("tex", {
	s("beg", {
    t("\\begin{"),i(1),t("}"),
		t({"","\t"}),i(0),
    t({"","\\end{"}),rep(1),t("}"),
  })}
  ,{
	  type = "autosnippets",
	  key = "tex",
  }
)

ls.add_snippets("tex", {
	s("im", {
    t("\\("),i(1),t("\\)"),i(0)
})})

ls.add_snippets("tex", {
	s("dm", {
    t("\\["),
		t({"","\t"}),i(1),
    t({"","\\]"}),i(0),
})})
