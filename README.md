# Vim Configuration Manager

A minimalist, idempotent vim configuration manager for macOS and Ubuntu.

## Quick Start

```bash
make install
```

For detailed documentation, see [CLAUDE.md](CLAUDE.md).

For configuration details and rationale, see [discussion.md](discussion.md).

## Key Features

- Idempotent configuration management
- Automatic drift detection and removal
- Interactive and non-interactive modes
- Automatic backups before changes
- Cross-platform (macOS and Ubuntu)
- Minimal and default profiles

## Common Commands

```bash
make install              # Install with defaults
make install-interactive  # Interactive installation
make check               # Check for drift
make backup              # Backup current config
make help                # Show all commands
```

@CLAUDE.md
@discussion.md