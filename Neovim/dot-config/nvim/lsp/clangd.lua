return {
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        '.git',
    },
}
