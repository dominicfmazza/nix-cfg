require("lspconfig").clangd.setup({
        root_dir = require("lspconfig").root_pattern(
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'build/compile_commands.json',
            'compile_flags.txt',
            'configure.ac',
            '.git'
        )
    }
)
