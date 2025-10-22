#!/usr/bin/env python3
"""
Vim Theme Selector

Interactive terminal-based theme selector for vim color schemes.
Allows users to preview and select from available themes.

Usage:
    python select_theme.py                 # Interactive mode
    python select_theme.py --theme claude  # Set theme directly
    python select_theme.py --list          # List available themes
    python select_theme.py --preview       # Preview all themes
"""

import argparse
import os
import re
import shutil
import sys
from pathlib import Path
from typing import Dict, List, Optional


# ANSI color codes for terminal output
class Colors:
    RESET = '\033[0m'
    BOLD = '\033[1m'
    DIM = '\033[2m'

    # Foreground colors
    BLACK = '\033[30m'
    RED = '\033[31m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m'
    BLUE = '\033[34m'
    MAGENTA = '\033[35m'
    CYAN = '\033[36m'
    WHITE = '\033[37m'

    # Bright foreground colors
    BRIGHT_BLACK = '\033[90m'
    BRIGHT_RED = '\033[91m'
    BRIGHT_GREEN = '\033[92m'
    BRIGHT_YELLOW = '\033[93m'
    BRIGHT_BLUE = '\033[94m'
    BRIGHT_MAGENTA = '\033[95m'
    BRIGHT_CYAN = '\033[96m'
    BRIGHT_WHITE = '\033[97m'

    # Background colors
    BG_BLACK = '\033[40m'
    BG_RED = '\033[41m'
    BG_GREEN = '\033[42m'
    BG_YELLOW = '\033[43m'
    BG_BLUE = '\033[44m'
    BG_MAGENTA = '\033[45m'
    BG_CYAN = '\033[46m'
    BG_WHITE = '\033[47m'


# Theme metadata
THEMES = {
    'claude': {
        'name': 'Claude',
        'description': 'Anthropic brand colors - professional and refined',
        'colors': ['Orange', 'Blue', 'Green'],
        'mood': 'Professional',
        'preview_color': Colors.BRIGHT_YELLOW,
    },
    'oceanic': {
        'name': 'Oceanic',
        'description': 'Deep blue ocean theme - calming and focused',
        'colors': ['Blue', 'Aqua', 'Coral'],
        'mood': 'Calming',
        'preview_color': Colors.BRIGHT_BLUE,
    },
    'forest': {
        'name': 'Forest',
        'description': 'Nature-inspired greens - peaceful and natural',
        'colors': ['Green', 'Sage', 'Earth'],
        'mood': 'Peaceful',
        'preview_color': Colors.BRIGHT_GREEN,
    },
    'sunset': {
        'name': 'Sunset',
        'description': 'Warm oranges and reds - energetic and vibrant',
        'colors': ['Orange', 'Red', 'Yellow'],
        'mood': 'Energetic',
        'preview_color': Colors.BRIGHT_RED,
    },
    'monochrome': {
        'name': 'Monochrome',
        'description': 'Clean black and white - minimalist and focused',
        'colors': ['Black', 'White', 'Gray'],
        'mood': 'Minimalist',
        'preview_color': Colors.BRIGHT_WHITE,
    },
    'nord': {
        'name': 'Nord',
        'description': 'Arctic-inspired cool blues - elegant and modern',
        'colors': ['Blue', 'Frost', 'Aurora'],
        'mood': 'Elegant',
        'preview_color': Colors.BRIGHT_CYAN,
    },
    'synthwave': {
        'name': 'Synthwave',
        'description': 'Retro 80s neon - bold and nostalgic',
        'colors': ['Purple', 'Pink', 'Cyan'],
        'mood': 'Bold',
        'preview_color': Colors.BRIGHT_MAGENTA,
    },
}


class ThemeSelector:
    """Handles theme selection and application."""

    def __init__(self):
        """Initialize the theme selector."""
        self.repo_root = Path(__file__).parent.absolute()
        self.colors_dir = self.repo_root / 'colors'
        self.home_dir = Path.home()
        self.vimrc_path = self.home_dir / '.vimrc'
        self.vim_colors_dir = self.home_dir / '.vim' / 'colors'

    def get_available_themes(self) -> List[str]:
        """Get list of available themes from the colors directory."""
        if not self.colors_dir.exists():
            return []

        themes = []
        for file in self.colors_dir.glob('*.vim'):
            theme_name = file.stem
            themes.append(theme_name)

        return sorted(themes)

    def display_theme_list(self, available_themes: List[str]):
        """Display a formatted list of available themes."""
        print(f"\n{Colors.BOLD}Available Vim Themes:{Colors.RESET}")
        print("=" * 70)

        for i, theme in enumerate(available_themes, 1):
            theme_info = THEMES.get(theme, {
                'name': theme.title(),
                'description': 'Custom theme',
                'colors': [],
                'mood': '',
                'preview_color': Colors.WHITE,
            })

            preview_color = theme_info['preview_color']
            name = theme_info['name']
            description = theme_info['description']
            mood = theme_info['mood']

            print(f"\n{preview_color}{Colors.BOLD}{i}. {name}{Colors.RESET}")
            print(f"   {Colors.DIM}{description}{Colors.RESET}")
            if mood:
                print(f"   {Colors.DIM}Mood: {mood}{Colors.RESET}")

    def display_theme_preview(self, theme: str):
        """Display a preview of a specific theme."""
        theme_info = THEMES.get(theme, {
            'name': theme.title(),
            'description': 'Custom theme',
            'colors': [],
            'preview_color': Colors.WHITE,
        })

        preview_color = theme_info['preview_color']
        name = theme_info['name']
        description = theme_info['description']
        colors = theme_info.get('colors', [])

        print(f"\n{preview_color}{Colors.BOLD}╔{'═' * 68}╗{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET} {name:^66} {preview_color}{Colors.BOLD}║{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}╠{'═' * 68}╣{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET} {description:66} {preview_color}{Colors.BOLD}║{Colors.RESET}")
        if colors:
            colors_str = ', '.join(colors)
            print(f"{preview_color}{Colors.BOLD}║{Colors.RESET} Colors: {colors_str:58} {preview_color}{Colors.BOLD}║{Colors.RESET}")

        # Sample code preview
        print(f"{preview_color}{Colors.BOLD}╠{'═' * 68}╣{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET} Code Preview:                                                     {preview_color}{Colors.BOLD}║{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET}   {Colors.DIM}# This is a comment{Colors.RESET}                                            {preview_color}{Colors.BOLD}║{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET}   {Colors.BOLD}def{Colors.RESET} {preview_color}hello_world{Colors.RESET}():                                          {preview_color}{Colors.BOLD}║{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET}       {Colors.GREEN}\"\"\"Sample function\"\"\"{Colors.RESET}                                    {preview_color}{Colors.BOLD}║{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}║{Colors.RESET}       {Colors.CYAN}print{Colors.RESET}({Colors.GREEN}\"Hello, World!\"{Colors.RESET})                                    {preview_color}{Colors.BOLD}║{Colors.RESET}")
        print(f"{preview_color}{Colors.BOLD}╚{'═' * 68}╝{Colors.RESET}\n")

    def get_current_theme(self) -> Optional[str]:
        """Get the currently set theme from .vimrc."""
        if not self.vimrc_path.exists():
            return None

        with open(self.vimrc_path, 'r') as f:
            content = f.read()

        # Look for colorscheme line
        match = re.search(r'^\s*colorscheme\s+(\w+)', content, re.MULTILINE)
        if match:
            return match.group(1)

        return None

    def install_theme_files(self):
        """Install theme files to ~/.vim/colors/."""
        if not self.colors_dir.exists():
            print(f"{Colors.RED}Error: colors directory not found at {self.colors_dir}{Colors.RESET}")
            return False

        # Create colors directory if it doesn't exist
        self.vim_colors_dir.mkdir(parents=True, exist_ok=True)

        # Copy all theme files
        theme_files = list(self.colors_dir.glob('*.vim'))
        if not theme_files:
            print(f"{Colors.RED}Error: No theme files found in {self.colors_dir}{Colors.RESET}")
            return False

        print(f"\n{Colors.BOLD}Installing theme files...{Colors.RESET}")
        for theme_file in theme_files:
            dest = self.vim_colors_dir / theme_file.name
            shutil.copy2(theme_file, dest)
            print(f"  {Colors.GREEN}✓{Colors.RESET} Installed {theme_file.name}")

        return True

    def set_theme(self, theme: str) -> bool:
        """Set the theme in .vimrc."""
        if not self.vimrc_path.exists():
            print(f"{Colors.RED}Error: .vimrc not found at {self.vimrc_path}{Colors.RESET}")
            print(f"{Colors.YELLOW}Run 'make install' first to create your vim configuration.{Colors.RESET}")
            return False

        # Read current vimrc
        with open(self.vimrc_path, 'r') as f:
            content = f.read()

        # Replace colorscheme line
        # Look for existing colorscheme line
        if re.search(r'^\s*colorscheme\s+', content, re.MULTILINE):
            # Replace existing colorscheme
            new_content = re.sub(
                r'^\s*colorscheme\s+\w+.*$',
                f'    colorscheme {theme}',
                content,
                flags=re.MULTILINE
            )
        else:
            # Add colorscheme after the try/catch block or at the end of colors section
            if 'endtry' in content:
                new_content = re.sub(
                    r'(endtry)',
                    f'\\1\n    colorscheme {theme}',
                    content,
                    count=1
                )
            else:
                # Add before the "--- Splits ---" section or at the end
                if '--- Splits ---' in content:
                    new_content = re.sub(
                        r'(" --- Splits ---)',
                        f'colorscheme {theme}\n\n\\1',
                        content,
                        count=1
                    )
                else:
                    new_content = content + f'\ncolorscheme {theme}\n'

        # Backup current vimrc
        backup_path = self.vimrc_path.with_suffix('.vimrc.backup.theme')
        shutil.copy2(self.vimrc_path, backup_path)

        # Write new vimrc
        with open(self.vimrc_path, 'w') as f:
            f.write(new_content)

        print(f"\n{Colors.GREEN}{Colors.BOLD}✓ Theme set to '{theme}'{Colors.RESET}")
        print(f"  Backup saved to {backup_path}")

        return True

    def interactive_selection(self) -> Optional[str]:
        """Run interactive theme selection."""
        available_themes = self.get_available_themes()

        if not available_themes:
            print(f"{Colors.RED}Error: No themes found in {self.colors_dir}{Colors.RESET}")
            return None

        # Display current theme
        current_theme = self.get_current_theme()
        if current_theme:
            print(f"\n{Colors.BOLD}Current theme:{Colors.RESET} {Colors.CYAN}{current_theme}{Colors.RESET}")

        # Display themes
        self.display_theme_list(available_themes)

        # Get user selection
        print(f"\n{Colors.BOLD}Select a theme (1-{len(available_themes)}) or 'q' to quit:{Colors.RESET}")

        while True:
            try:
                choice = input(f"{Colors.BRIGHT_CYAN}> {Colors.RESET}").strip().lower()

                if choice == 'q':
                    print("Selection cancelled.")
                    return None

                if choice == '':
                    continue

                # Try to parse as number
                try:
                    index = int(choice) - 1
                    if 0 <= index < len(available_themes):
                        selected_theme = available_themes[index]

                        # Show preview
                        self.display_theme_preview(selected_theme)

                        # Confirm
                        confirm = input(f"{Colors.BOLD}Apply this theme? (Y/n):{Colors.RESET} ").strip().lower()
                        if confirm != 'n':
                            return selected_theme
                        else:
                            print("Theme not applied. Select another or 'q' to quit.")
                            continue
                    else:
                        print(f"{Colors.RED}Invalid selection. Please choose 1-{len(available_themes)}.{Colors.RESET}")
                except ValueError:
                    # Maybe it's a theme name
                    if choice in available_themes:
                        return choice
                    else:
                        print(f"{Colors.RED}Invalid selection. Please enter a number or 'q' to quit.{Colors.RESET}")

            except KeyboardInterrupt:
                print(f"\n{Colors.YELLOW}Selection cancelled.{Colors.RESET}")
                return None
            except EOFError:
                print(f"\n{Colors.YELLOW}Selection cancelled.{Colors.RESET}")
                return None

    def run(self, theme: Optional[str] = None, list_only: bool = False, preview_all: bool = False):
        """Run the theme selector."""
        # Ensure theme files are installed
        if not list_only and not preview_all:
            if not self.install_theme_files():
                return False

        available_themes = self.get_available_themes()

        if list_only:
            self.display_theme_list(available_themes)
            return True

        if preview_all:
            for theme in available_themes:
                self.display_theme_preview(theme)
            return True

        if theme:
            # Direct theme selection
            if theme not in available_themes:
                print(f"{Colors.RED}Error: Theme '{theme}' not found.{Colors.RESET}")
                print(f"{Colors.YELLOW}Available themes: {', '.join(available_themes)}{Colors.RESET}")
                return False

            self.install_theme_files()
            return self.set_theme(theme)
        else:
            # Interactive selection
            selected_theme = self.interactive_selection()
            if selected_theme:
                return self.set_theme(selected_theme)
            return False


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description='Interactive vim theme selector',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                     # Interactive mode
  %(prog)s --theme claude      # Set Claude theme
  %(prog)s --list              # List available themes
  %(prog)s --preview           # Preview all themes

Available themes:
  - claude      : Anthropic brand colors (professional)
  - oceanic     : Deep blue ocean (calming)
  - forest      : Nature-inspired greens (peaceful)
  - sunset      : Warm oranges and reds (energetic)
  - monochrome  : Clean black and white (minimalist)
  - nord        : Arctic-inspired blues (elegant)
  - synthwave   : Retro 80s neon (bold)
        """
    )

    parser.add_argument(
        '-t', '--theme',
        type=str,
        help='Set theme directly without interactive mode'
    )

    parser.add_argument(
        '-l', '--list',
        action='store_true',
        help='List available themes and exit'
    )

    parser.add_argument(
        '-p', '--preview',
        action='store_true',
        help='Preview all themes and exit'
    )

    args = parser.parse_args()

    selector = ThemeSelector()

    try:
        success = selector.run(
            theme=args.theme,
            list_only=args.list,
            preview_all=args.preview
        )
        return 0 if success else 1
    except KeyboardInterrupt:
        print(f"\n{Colors.YELLOW}Operation cancelled.{Colors.RESET}")
        return 1
    except Exception as e:
        print(f"\n{Colors.RED}Error: {e}{Colors.RESET}", file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())
