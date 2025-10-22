.PHONY: help install install-interactive check backup sync dry-run minimal clean test theme theme-list theme-preview

# Default target
.DEFAULT_GOAL := help

# Python executable
PYTHON := python3

# Script paths
SCRIPT := ./setup_vim.py
THEME_SCRIPT := ./select_theme.py

help: ## Show this help message
	@echo 'Vim Configuration Manager - Make Commands'
	@echo ''
	@echo 'Usage:'
	@echo '  make <target>'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install vim configuration (non-interactive, default settings)
	@echo "Installing vim configuration with defaults..."
	@$(PYTHON) $(SCRIPT)

install-interactive: ## Install vim configuration (interactive mode with prompts)
	@echo "Starting interactive installation..."
	@$(PYTHON) $(SCRIPT) --interactive

check: ## Check if current .vimrc has drifted from template
	@echo "Checking for configuration drift..."
	@$(PYTHON) $(SCRIPT) --dry-run

backup: ## Create backup of current .vimrc without installing
	@echo "Creating backup of current configuration..."
	@$(PYTHON) $(SCRIPT) --backup-only

sync: ## Sync .vimrc with template (removes drift)
	@echo "Syncing configuration with template..."
	@$(PYTHON) $(SCRIPT)

dry-run: ## Preview what would be done without making changes
	@echo "Running in dry-run mode..."
	@$(PYTHON) $(SCRIPT) --dry-run

minimal: ## Install minimal vim configuration
	@echo "Installing minimal vim configuration..."
	@$(PYTHON) $(SCRIPT) --minimal

clean: ## Remove all vim config files (CAREFUL!)
	@echo "WARNING: This will remove ~/.vimrc and backup files"
	@echo "Press Ctrl+C to cancel, Enter to continue..."
	@read confirm
	@rm -f ~/.vimrc
	@echo "Removed ~/.vimrc"

test: ## Run a dry-run test of the installation
	@echo "Testing installation (dry-run)..."
	@$(PYTHON) $(SCRIPT) --dry-run
	@echo ""
	@echo "Test completed successfully!"

# Advanced targets

install-dev: ## Install with development settings (interactive + dry-run first)
	@echo "Development installation (with preview)..."
	@$(PYTHON) $(SCRIPT) --dry-run --interactive
	@echo ""
	@echo "Press Enter to apply these settings, or Ctrl+C to cancel..."
	@read confirm
	@$(PYTHON) $(SCRIPT) --interactive

verify: ## Verify vim configuration is working
	@echo "Verifying vim configuration..."
	@if [ -f ~/.vimrc ]; then \
		echo "✓ ~/.vimrc exists"; \
		if vim --version >/dev/null 2>&1; then \
			echo "✓ vim is installed"; \
			vim -e -s -c "source ~/.vimrc" -c "quit" 2>&1 && echo "✓ .vimrc loads without errors" || echo "✗ .vimrc has errors"; \
		else \
			echo "✗ vim is not installed"; \
		fi \
	else \
		echo "✗ ~/.vimrc does not exist"; \
	fi

show-config: ## Show current .vimrc content
	@if [ -f ~/.vimrc ]; then \
		echo "Current ~/.vimrc content:"; \
		echo "========================"; \
		cat ~/.vimrc; \
	else \
		echo "No ~/.vimrc file found"; \
	fi

show-template: ## Show the template content
	@if [ -f vimrc.template ]; then \
		echo "Template content (vimrc.template):"; \
		echo "=================================="; \
		cat vimrc.template; \
	else \
		echo "No vimrc.template file found"; \
	fi

diff: ## Show diff between current config and template
	@if [ -f ~/.vimrc ] && [ -f vimrc.template ]; then \
		echo "Differences between ~/.vimrc and template:"; \
		echo "=========================================="; \
		diff -u vimrc.template ~/.vimrc || true; \
	else \
		echo "Cannot diff: missing ~/.vimrc or vimrc.template"; \
	fi

list-backups: ## List all .vimrc backup files
	@echo "Backup files in home directory:"
	@ls -lh ~/.vimrc.backup.* 2>/dev/null || echo "No backup files found"

restore-latest: ## Restore the most recent backup
	@latest=$$(ls -t ~/.vimrc.backup.* 2>/dev/null | head -1); \
	if [ -n "$$latest" ]; then \
		echo "Restoring from: $$latest"; \
		cp "$$latest" ~/.vimrc; \
		echo "✓ Restored ~/.vimrc from backup"; \
	else \
		echo "✗ No backup files found"; \
	fi

# Theme Selection

theme: ## Select and apply a vim theme interactively
	@echo "Starting interactive theme selector..."
	@$(PYTHON) $(THEME_SCRIPT)

theme-list: ## List all available themes
	@$(PYTHON) $(THEME_SCRIPT) --list

theme-preview: ## Preview all available themes
	@$(PYTHON) $(THEME_SCRIPT) --preview

theme-claude: ## Set Claude theme (Anthropic brand colors)
	@echo "Setting Claude theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme claude

theme-oceanic: ## Set Oceanic theme (deep blue ocean)
	@echo "Setting Oceanic theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme oceanic

theme-forest: ## Set Forest theme (nature-inspired greens)
	@echo "Setting Forest theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme forest

theme-sunset: ## Set Sunset theme (warm oranges and reds)
	@echo "Setting Sunset theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme sunset

theme-monochrome: ## Set Monochrome theme (clean black and white)
	@echo "Setting Monochrome theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme monochrome

theme-nord: ## Set Nord theme (arctic-inspired blues)
	@echo "Setting Nord theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme nord

theme-synthwave: ## Set Synthwave theme (retro 80s neon)
	@echo "Setting Synthwave theme..."
	@$(PYTHON) $(THEME_SCRIPT) --theme synthwave
