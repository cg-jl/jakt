# Vim syntax highlighting for Jakt

**Install Manually**

Copy or symlink `/path/to/jakt/editors/vim` directory to the vim plugins
directory, which is either `~/.vim/pack/plugins/start/` for vim or
`~/.local/share/nvim/site/pack/plugins/start/` for neovim.

**Install with [vim-plug](https://github.com/junegunn/vim-plug)**

 1. Add `Plug 'SerenityOS/jakt', { 'rtp': 'editors/vim' }` to your .vimrc
 2. Run `:PlugInstall`


## LSP Support **Neovim only**

To get LSP support, put this in your configuration:
```lua
require('jakt.lsp').setup {
    server_path = "path/to/built/jakt.exe",
}
```

Where `path/to/built/jakt.exe` is the path of the Jakt compiler executable
in your machine. This should set up Jakt LSP mode for you.
