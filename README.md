# DailyWriter.nvim

A Neovim plugin to assist daily writing tasks such as counting words, opening today's writing file, listing past writings, and syncing with Git.

## Installation

### Using packer.nvim

```lua
use {
    'montagao/dailywriter.nvim',
}

run `:PackerSync`

## Usage

### Word Count

This plugin automatically displays the word count of the current buffer whenever you move the cursor or change the text.

### Commands

- `:Today`: Opens today's writing file located in `~/writing/YYYY-MM-DD.txt`.
- `:Past`: Lists past writing files in `~/writing/` using Telescope.
- `:GitSync`: Syncs the current buffer to Git.

### Auto Commands

The word count feature is enabled by default and updates on the following events:

- `CursorMoved`
- `CursorHold`
- `TextChanged`
- `TextChangedI`

## Configuration

The plugin automatically configures the autocommands for word count and sets up the `:Today`, `:Past`, and `:GitSync` commands.

## Dependencies

- [Telescope](https://github.com/nvim-telescope/telescope.nvim) is required for the `:Past` command to work.

## License

MIT
