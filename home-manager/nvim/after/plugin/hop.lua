local hop = require("hop")

vim.keymap.set("n", "<leader>h", function() hop.hint_words() end)
