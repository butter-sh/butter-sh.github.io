# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

butter.sh is a Bash ecosystem providing a suite of integrated tools for bash development, testing, documentation, templating, and release management. The repository is structured as a monorepo containing multiple independent but interconnected projects under `projects/`.

## Repository Structure

```
butter.sh/
├── arty.yml                    # Root project configuration
├── projects.json               # Project metadata for landing page
├── projects/                   # Individual tool projects
│   ├── arty.sh/               # Dependency manager
│   ├── judge.sh/              # Testing framework
│   ├── myst.sh/               # Templating engine
│   ├── hammer.sh/             # Project scaffolding
│   ├── leaf.sh/               # Documentation generator
│   ├── whip.sh/               # Release management
│   └── clean.sh-original/     # Code formatter
├── docs/                       # Generated documentation
├── _assets/                    # Shared assets (icons, styles)
└── scripts/                    # Build/utility scripts
```

Each project in `projects/` follows the arty.sh structure with:
- `arty.yml` - Project configuration and metadata
- Main script (e.g., `arty.sh`, `judge.sh`) - Entry point
- `__tests/` - Test suites using judge.sh
- `README.md` - Project documentation
- `templates/` or `examples/` - Usage examples

## Core Tools and Architecture

### arty.sh - Dependency Manager
The foundation of the ecosystem. Manages bash libraries from Git repositories.
- Installs libraries to `.arty/libs/`
- Links executables to `.arty/bin/`
- Uses `arty.yml` for configuration (requires `yq`)
- Handles dependency resolution with circular dependency detection
- Key commands: `arty install`, `arty deps`, `arty exec`

### judge.sh - Testing Framework
Provides testing with snapshot support and assertion library.
- Main CLI: `judge.sh` delegates to specialized scripts
- Test files: `__tests/test-*.sh` pattern
- Snapshots stored in `__tests/snapshots/`
- Uses `test-helpers.sh` for assertion functions
- Key commands: `judge run`, `judge setup`, `judge snap`

### myst.sh - Templating Engine
Mustache-style templating with `.myst` file extension.
- Supports variables, conditionals, loops, partials, inheritance
- Multiple input formats: JSON, YAML, env vars, CLI args
- Used by hammer.sh and leaf.sh internally
- Requires `jq`, optionally `yq`

### hammer.sh - Project Scaffolding
CLI facade for myst.sh focused on project generation.
- Reads templates from `templates/` directories
- Uses arty.yml `hammer.templates` section for configuration
- Interactive or batch mode (`--yes` flag)
- Integrates with myst.sh for rendering

### leaf.sh - Documentation Generator
Generates static HTML documentation and landing pages.
- Documentation mode: Processes arty.yml projects
- Landing page mode: `--landing` flag with `--projects` JSON
- Uses myst.sh templates from `templates/` directory
- Requires `yq`, `jq`, and myst.sh

### whip.sh - Release Management
Semantic versioning and changelog automation.
- Version bumping: `patch`, `minor`, `major`
- Generates CHANGELOG.md from git commits
- Creates annotated git tags
- Monorepo support: `mono` subcommand
- Git hooks: `hooks install/uninstall`

## Common Development Commands

### Building Documentation
```bash
# Generate icons from SVG files
arty icons

# Generate all project documentation and landing page
arty docs
```

### Testing Individual Projects
```bash
cd projects/arty.sh
../../projects/judge.sh/judge.sh run          # Run all tests
../../projects/judge.sh/judge.sh run -t test-arty-cli  # Run specific test
../../projects/judge.sh/judge.sh run -u       # Update snapshots
```

Or use the local test runner if available:
```bash
cd projects/judge.sh
./run-all-tests.sh                            # Run all tests
./run-all-tests.sh -v                         # Verbose output
```

### Working with arty.yml
All projects use `arty.yml` for configuration:
- `name`: Project identifier
- `version`: Semantic version string
- `main`: Entry point script (linked to .arty/bin/)
- `references`: Git URLs of dependencies
- `scripts`: Named commands executable via `arty <script-name>`

### Installing Dependencies
Each project can install its own dependencies:
```bash
cd projects/leaf.sh
arty deps  # Installs dependencies from arty.yml references
```

## Testing Architecture

Tests follow the judge.sh framework pattern:
1. Source `test-helpers.sh` or `test-config.sh`
2. Use `setup_test_env` to create temp directories
3. Write tests with assertion functions (assert_equals, assert_contains, etc.)
4. Use `cleanup_test_env` to remove temp files
5. Call `print_test_summary` to display results

Snapshot testing:
- Master snapshots: `*_master.log` (commit to git)
- Runtime snapshots: `*_YYYYMMDD_HHMMSS.log` (temporary)
- Compare with `judge snap diff <test-name>`

## Integration Points

The tools are designed to work together:
- **arty.sh** installs all other tools as dependencies
- **myst.sh** powers hammer.sh and leaf.sh templating
- **judge.sh** tests all projects
- **whip.sh** manages releases for all projects
- **leaf.sh** generates documentation for all projects
- **hammer.sh** scaffolds new projects using the ecosystem

## Dependencies

### Required System Tools
- `bash` 4.0+
- `git`
- `yq` - YAML processor (https://github.com/mikefarah/yq)
- `jq` - JSON processor

### Installation Priority
1. Install `yq` and `jq` first
2. Projects can then be used standalone or via arty.sh

## File Naming Conventions

- Main executables: `<tool-name>.sh` (e.g., `arty.sh`, `judge.sh`)
- Test files: `test-*.sh` in `__tests/` directories
- Template files: `*.myst` extension
- Configuration: `arty.yml` (YAML format)
- Setup scripts: `setup.sh` (runs on arty.sh installation)

## Color Output

All tools use consistent color coding via terminal escape codes:
- `RED`: Errors
- `GREEN`: Success messages
- `YELLOW`: Warnings
- `BLUE`: Info messages
- `CYAN`: Highlight
- Respects `FORCE_COLOR` environment variable

## Best Practices

- Maintain backward compatibility across tools
- Use `set -euo pipefail` in all bash scripts
- Provide both interactive and non-interactive modes
- Support running from any directory (use absolute paths)
- Include comprehensive error messages with suggested fixes
- Follow semantic versioning for releases
- Commit test snapshots to version control
