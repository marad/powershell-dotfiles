require("marad.remap")
require("marad.set")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

