#!/usr/bin/env python3
"""
Vim Configuration Manager

This script manages vim configuration in an idempotent way, ensuring
your ~/.vimrc matches the repository template and removes any drift.

Usage:
    python setup_vim.py                    # Non-interactive with defaults
    python setup_vim.py --interactive      # Interactive mode with prompts
    python setup_vim.py --minimal          # Minimal configuration
    python setup_vim.py --backup-only      # Create backup without applying
"""

import argparse
import hashlib
import os
import shutil
import sys
from datetime import datetime
from pathlib import Path
from typing import Optional, Dict, Any


class VimConfigManager:
    """Manages vim configuration setup and synchronization."""

    def __init__(self, interactive: bool = False, dry_run: bool = False):
        """
        Initialize the vim config manager.

        Args:
            interactive: Whether to prompt for user input
            dry_run: If True, show what would be done without doing it
        """
        self.interactive = interactive
        self.dry_run = dry_run
        self.repo_root = Path(__file__).parent.absolute()
        self.home_dir = Path.home()
        self.vimrc_path = self.home_dir / '.vimrc'
        self.vim_dir = self.home_dir / '.vim'
        self.backup_dir = self.vim_dir / 'backup'
        self.swap_dir = self.vim_dir / 'swap'
        self.undo_dir = self.vim_dir / 'undo'
        self.local_vimrc = self.home_dir / '.vimrc.local'

    def calculate_file_hash(self, filepath: Path) -> Optional[str]:
        """Calculate SHA256 hash of a file."""
        if not filepath.exists():
            return None

        sha256_hash = hashlib.sha256()
        with open(filepath, "rb") as f:
            for byte_block in iter(lambda: f.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()

    def backup_existing_config(self) -> Optional[Path]:
        """Create a backup of the existing .vimrc file."""
        if not self.vimrc_path.exists():
            print("No existing .vimrc found, no backup needed.")
            return None

        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_path = self.home_dir / f'.vimrc.backup.{timestamp}'

        if self.dry_run:
            print(f"[DRY RUN] Would backup {self.vimrc_path} to {backup_path}")
            return backup_path

        shutil.copy2(self.vimrc_path, backup_path)
        print(f"Backed up existing .vimrc to {backup_path}")
        return backup_path

    def ensure_vim_directories(self):
        """Ensure all necessary vim directories exist."""
        directories = [self.vim_dir, self.backup_dir, self.swap_dir, self.undo_dir]

        for directory in directories:
            if self.dry_run:
                if not directory.exists():
                    print(f"[DRY RUN] Would create directory: {directory}")
            else:
                directory.mkdir(parents=True, exist_ok=True, mode=0o700)
                print(f"Ensured directory exists: {directory}")

    def get_config_options(self) -> Dict[str, Any]:
        """
        Get configuration options from user or defaults.

        Returns:
            Dictionary of configuration options
        """
        options = {
            'mouse_support': True,
            'relative_numbers': True,
            'color_scheme': 'desert',
            'tab_width': 4,
            'create_backups': True,
        }

        if not self.interactive:
            print("Using default configuration options:")
            for key, value in options.items():
                print(f"  {key}: {value}")
            return options

        print("\nInteractive Configuration Setup")
        print("=" * 50)
        print("Press Enter to accept defaults shown in brackets.\n")

        # Mouse support
        response = input(f"Enable mouse support? [Y/n]: ").strip().lower()
        options['mouse_support'] = response != 'n'

        # Relative line numbers
        response = input(f"Use relative line numbers? [Y/n]: ").strip().lower()
        options['relative_numbers'] = response != 'n'

        # Color scheme
        schemes = ['desert', 'slate', 'pablo', 'default']
        print(f"\nAvailable color schemes: {', '.join(schemes)}")
        response = input(f"Color scheme [desert]: ").strip() or 'desert'
        options['color_scheme'] = response if response in schemes else 'desert'

        # Tab width
        response = input(f"Tab width (2/4/8) [4]: ").strip()
        try:
            width = int(response) if response else 4
            options['tab_width'] = width if width in [2, 4, 8] else 4
        except ValueError:
            options['tab_width'] = 4

        # Backups
        response = input(f"Create backup files? [Y/n]: ").strip().lower()
        options['create_backups'] = response != 'n'

        print("\nConfiguration options set:")
        for key, value in options.items():
            print(f"  {key}: {value}")

        return options

    def generate_config(self, template_path: Path, options: Dict[str, Any]) -> str:
        """
        Generate vim configuration from template with options applied.

        Args:
            template_path: Path to the template file
            options: Configuration options to apply

        Returns:
            Generated configuration content
        """
        with open(template_path, 'r') as f:
            content = f.read()

        # Apply options by modifying specific lines
        # For now, we'll use the template as-is and note that
        # advanced customization can be done via .vimrc.local

        if not options['mouse_support']:
            content = content.replace('set mouse=a', '" set mouse=a  " Disabled by setup')

        if not options['relative_numbers']:
            content = content.replace('set relativenumber', '" set relativenumber  " Disabled by setup')

        if options['color_scheme'] != 'desert':
            content = content.replace('colorscheme desert', f'colorscheme {options["color_scheme"]}')

        if options['tab_width'] != 4:
            content = content.replace('set tabstop=4', f'set tabstop={options["tab_width"]}')
            content = content.replace('set shiftwidth=4', f'set shiftwidth={options["tab_width"]}')
            content = content.replace('set softtabstop=4', f'set softtabstop={options["tab_width"]}')

        if not options['create_backups']:
            content = content.replace('set backup', '" set backup  " Disabled by setup')

        return content

    def check_drift(self, template_path: Path) -> bool:
        """
        Check if current .vimrc has drifted from the template.

        Args:
            template_path: Path to the template file

        Returns:
            True if drift detected, False otherwise
        """
        if not self.vimrc_path.exists():
            print("No existing .vimrc found - will create new one.")
            return True

        # For default config, check if hashes match
        template_hash = self.calculate_file_hash(template_path)
        current_hash = self.calculate_file_hash(self.vimrc_path)

        if template_hash == current_hash:
            print("No drift detected - .vimrc matches template exactly.")
            return False

        print("Drift detected - .vimrc differs from template.")
        return True

    def apply_config(self, content: str):
        """
        Apply the vim configuration.

        Args:
            content: Configuration content to write
        """
        if self.dry_run:
            print(f"[DRY RUN] Would write configuration to {self.vimrc_path}")
            print("\n--- Configuration Preview (first 500 chars) ---")
            print(content[:500])
            print("...")
            return

        with open(self.vimrc_path, 'w') as f:
            f.write(content)
        print(f"Successfully wrote configuration to {self.vimrc_path}")

    def check_local_config(self):
        """Check and report on local config file."""
        if self.local_vimrc.exists():
            print(f"\nLocal config file exists: {self.local_vimrc}")
            print("This file will be sourced after the main config.")
            with open(self.local_vimrc, 'r') as f:
                local_content = f.read()
            print(f"Local config has {len(local_content.splitlines())} lines.")
        else:
            print(f"\nNo local config file found at {self.local_vimrc}")
            print("You can create this file for machine-specific overrides.")

    def setup(self, profile: str = 'default'):
        """
        Main setup process.

        Args:
            profile: Configuration profile to use (default, minimal, etc.)
        """
        print("Vim Configuration Manager")
        print("=" * 50)

        # Determine template path
        if profile == 'minimal':
            template_path = self.repo_root / 'vimrc.minimal.template'
            if not template_path.exists():
                print(f"Warning: Minimal template not found, using default.")
                template_path = self.repo_root / 'vimrc.template'
        else:
            template_path = self.repo_root / 'vimrc.template'

        if not template_path.exists():
            print(f"Error: Template file not found at {template_path}")
            sys.exit(1)

        print(f"Using template: {template_path.name}")
        print(f"Target: {self.vimrc_path}")
        print()

        # Check for drift
        has_drift = self.check_drift(template_path)

        # Backup existing config
        if has_drift and self.vimrc_path.exists():
            backup_path = self.backup_existing_config()

        # Ensure directories exist
        self.ensure_vim_directories()

        # Get configuration options
        options = self.get_config_options()

        # Generate configuration
        print("\nGenerating configuration...")
        config_content = self.generate_config(template_path, options)

        # Apply configuration
        print("\nApplying configuration...")
        self.apply_config(config_content)

        # Check local config
        self.check_local_config()

        print("\n" + "=" * 50)
        if self.dry_run:
            print("DRY RUN completed - no changes were made.")
        else:
            print("Vim configuration setup completed successfully!")
            print(f"\nYour vim is now configured according to {template_path.name}")
            print("You can start using vim with your new configuration.")

        print("\nNext steps:")
        print("  1. Run 'vim' to test your configuration")
        print("  2. Edit ~/.vimrc.local for machine-specific settings")
        print("  3. Re-run this script anytime to sync with the template")


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description='Manage vim configuration idempotently',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                        # Apply default config non-interactively
  %(prog)s --interactive          # Interactive mode with prompts
  %(prog)s --minimal              # Use minimal configuration
  %(prog)s --dry-run              # Preview changes without applying
  %(prog)s --backup-only          # Only create backup, don't apply

The script is idempotent - running it multiple times is safe.
        """
    )

    parser.add_argument(
        '-i', '--interactive',
        action='store_true',
        help='Run in interactive mode with prompts'
    )

    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show what would be done without making changes'
    )

    parser.add_argument(
        '--minimal',
        action='store_true',
        help='Use minimal configuration profile'
    )

    parser.add_argument(
        '--backup-only',
        action='store_true',
        help='Only create backup of existing config'
    )

    parser.add_argument(
        '--profile',
        choices=['default', 'minimal'],
        default='default',
        help='Configuration profile to use'
    )

    args = parser.parse_args()

    # Handle minimal flag
    if args.minimal:
        args.profile = 'minimal'

    # Create manager
    manager = VimConfigManager(
        interactive=args.interactive,
        dry_run=args.dry_run
    )

    # Handle backup-only mode
    if args.backup_only:
        print("Backup-only mode")
        manager.backup_existing_config()
        return 0

    # Run setup
    try:
        manager.setup(profile=args.profile)
        return 0
    except KeyboardInterrupt:
        print("\n\nSetup interrupted by user.")
        return 1
    except Exception as e:
        print(f"\nError: {e}", file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())
