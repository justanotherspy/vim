# VIM Configuration Manager

This repository contains a minimalist vim configuration and management tools for macOS and Ubuntu.

## Quick Start

```bash
# Install with default settings
make install

# Install with interactive prompts
make install-interactive

# Check what would change (dry-run)
make check
```

## Available Commands

### Installation Commands

- `make install` - Install vim configuration with default settings (non-interactive)
- `make install-interactive` - Install with interactive prompts for customization
- `make minimal` - Install a minimal vim configuration
- `make sync` - Sync your .vimrc with the template (removes drift)

### Theme Commands

- `make theme` - Interactive theme selector with previews
- `make theme-list` - List all available themes
- `make theme-preview` - Preview all themes
- `make theme-claude` - Set Claude theme (Anthropic brand colors)
- `make theme-oceanic` - Set Oceanic theme (deep blue ocean)
- `make theme-forest` - Set Forest theme (nature-inspired greens)
- `make theme-sunset` - Set Sunset theme (warm oranges and reds)
- `make theme-monochrome` - Set Monochrome theme (clean black and white)
- `make theme-nord` - Set Nord theme (arctic-inspired blues)
- `make theme-synthwave` - Set Synthwave theme (retro 80s neon)

### Testing & Verification

- `make check` - Check if current .vimrc has drifted from template
- `make dry-run` - Preview what would be done without making changes
- `make test` - Run a dry-run test of the installation
- `make verify` - Verify vim configuration is working correctly

### Backup & Recovery

- `make backup` - Create backup of current .vimrc without installing
- `make list-backups` - List all .vimrc backup files
- `make restore-latest` - Restore the most recent backup

### Information Commands

- `make help` - Show all available commands
- `make show-config` - Display current .vimrc content
- `make show-template` - Display the template content
- `make diff` - Show differences between current config and template

### Advanced Commands

- `make install-dev` - Development installation (preview + interactive)
- `make clean` - Remove all vim config files (use with caution!)

## Files

- `vimrc.template` - The master vim configuration template
- `setup_vim.py` - Python script for managing vim configuration
- `select_theme.py` - Interactive theme selector script
- `colors/` - Directory containing custom vim color schemes
- `Makefile` - Convenient make commands for common tasks

## Features

The vim configuration includes:
- Line numbers (absolute and relative)
- Mouse support in all modes
- Smart indentation (4 spaces by default)
- Syntax highlighting with multiple color themes
- Persistent undo history
- Organized backup/swap/undo files
- Useful key mappings (Space as leader)
- Platform-specific clipboard support
- Support for local overrides via `~/.vimrc.local`

## Themes

The repository includes 7 carefully crafted color themes:

1. **Claude** - Anthropic brand colors (professional and refined)
   - Dark: #141413, Light: #faf9f5
   - Accents: Orange (#d97757), Blue (#6a9bcc), Green (#788c5d)

2. **Oceanic** - Deep blue ocean theme (calming and focused)
   - Inspired by the depths of the ocean

3. **Forest** - Nature-inspired greens (peaceful and natural)
   - Calming earth tones and forest colors

4. **Sunset** - Warm oranges and reds (energetic and vibrant)
   - Perfect for those who prefer warm color palettes

5. **Monochrome** - Clean black and white (minimalist and focused)
   - For maximum clarity and minimal distraction

6. **Nord** - Arctic-inspired cool blues (elegant and modern)
   - Based on the popular Nord color palette

7. **Synthwave** - Retro 80s neon (bold and nostalgic)
   - Vibrant purples, pinks, and cyans

To change themes, run `make theme` for an interactive selector or `make theme-<name>` to set directly.

## Customization

1. Run `make install-interactive` to customize during installation
2. Create `~/.vimrc.local` for machine-specific settings that won't be overwritten

## Direct Script Usage

You can also use the Python script directly:

```bash
# Non-interactive with defaults
./setup_vim.py

# Interactive mode
./setup_vim.py --interactive

# Dry run
./setup_vim.py --dry-run

# Minimal profile
./setup_vim.py --minimal

# Backup only
./setup_vim.py --backup-only
```

## Idempotency

The script is fully idempotent - you can run it multiple times safely. It will:
- Detect drift between your config and the template
- Create automatic backups before making changes
- Ensure all necessary directories exist
- Apply the configuration consistently

@README.md
@discussion.md
