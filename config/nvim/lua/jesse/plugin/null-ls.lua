-- null-ls
return require("null-ls").setup({
    sources = {
        require("null-ls").builtins.completion.spell
    },
})
