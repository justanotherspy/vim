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
- `Makefile` - Convenient make commands for common tasks

## Features

The vim configuration includes:
- Line numbers (absolute and relative)
- Mouse support in all modes
- Smart indentation (4 spaces by default)
- Syntax highlighting
- Persistent undo history
- Organized backup/swap/undo files
- Useful key mappings (Space as leader)
- Platform-specific clipboard support
- Support for local overrides via `~/.vimrc.local`

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
