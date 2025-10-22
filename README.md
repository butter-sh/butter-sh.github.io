<div align="center">

<img src="./icon.svg" width="120" height="120" alt="butter.sh" style="margin-bottom: 1rem;">

# butter.sh

**Professional Bash Development Ecosystem**

[![Organization](https://img.shields.io/badge/org-butter--sh-4ade80?style=for-the-badge&logo=github&logoColor=white)](https://github.com/butter-sh)
[![License](https://img.shields.io/badge/license-MIT-86efac?style=for-the-badge)](LICENSE)
[![Projects](https://img.shields.io/badge/projects-7-22c55e?style=for-the-badge)](#projects)
[![Docs](https://img.shields.io/badge/docs-online-4ade80?style=for-the-badge)](https://butter-sh.github.io)

*A complete, integrated suite of tools for professional bash development*

[Documentation](https://butter-sh.github.io) • [GitHub](https://github.com/butter-sh) • [Getting Started](#quick-start)

</div>

---

## What is butter.sh?

butter.sh is a comprehensive ecosystem of interconnected bash tools designed to bring modern development workflows to shell scripting. From dependency management and project scaffolding to testing, documentation, and release automation, butter.sh provides everything needed to build, maintain, and distribute professional bash applications.

### Philosophy

**Unlimited** — No artificial constraints, full control over your bash environment
**Independent** — Each tool works standalone or as part of the ecosystem
**Fresh** — Modern features and workflows for contemporary bash development

---

## Projects

### <img src="https://raw.githubusercontent.com/butter-sh/arty.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> arty.sh — Bash Dependency Manager

Install and manage bash libraries from Git repositories with complete dependency resolution, automatic linking, and package configuration.

**Key Features:** Git repository integration • Dependency graph resolution • Binary linking • YAML configuration • Setup hooks

```bash
arty install https://github.com/butter-sh/myst.sh.git
arty deps  # Install all dependencies from arty.yml
arty exec <library> [args]  # Execute library scripts
```

[Documentation](https://butter-sh.github.io/arty.sh) • [Source](https://github.com/butter-sh/arty.sh)

---

### <img src="https://raw.githubusercontent.com/butter-sh/judge.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> judge.sh — Testing Framework

Professional testing framework with comprehensive assertion library, snapshot testing, and beautiful output formatting.

**Key Features:** Rich assertion library • Snapshot testing • Test isolation • Detailed reporting • Colorful output

```bash
judge run                  # Run all tests
judge run -t test-name     # Run specific test
judge snap update test-name  # Update snapshots
```

[Documentation](https://butter-sh.github.io/judge.sh) • [Source](https://github.com/butter-sh/judge.sh)

---

### <img src="https://raw.githubusercontent.com/butter-sh/myst.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> myst.sh — Templating Engine

Advanced mustache-style templating with conditionals, loops, partials, template inheritance, and support for JSON, YAML, and environment variables.

**Key Features:** Mustache syntax • Conditionals & loops • Partials & inheritance • Multi-format input • Nested data access

```bash
myst template.myst -d data.json -o output.txt
myst template.myst -y config.yml -v key=value
```

[Documentation](https://butter-sh.github.io/myst.sh) • [Source](https://github.com/butter-sh/myst.sh)

---

### <img src="https://raw.githubusercontent.com/butter-sh/hammer.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> hammer.sh — Project Scaffolding

Generate complete projects from templates with interactive configuration, variable substitution, and intelligent file management.

**Key Features:** Template-based generation • Interactive prompts • Variable substitution • Smart overwrite detection • Integration with myst.sh

```bash
hammer init project-name
hammer new template-name output-dir
hammer list  # Show available templates
```

[Documentation](https://butter-sh.github.io/hammer.sh) • [Source](https://github.com/butter-sh/hammer.sh)

---

### <img src="https://raw.githubusercontent.com/butter-sh/leaf.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> leaf.sh — Documentation Generator

Transform project metadata into beautiful, responsive documentation websites with automatic page generation and modern design.

**Key Features:** Responsive design • Automatic navigation • Syntax highlighting • Theme support • arty.yml integration

```bash
leaf project-dir -o docs/
leaf --landing -p projects.json -o index.html
```

[Documentation](https://butter-sh.github.io/leaf.sh) • [Source](https://github.com/butter-sh/leaf.sh)

---

### <img src="https://raw.githubusercontent.com/butter-sh/whip.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> whip.sh — Release Management

Automate release workflows with semantic versioning, changelog generation from git history, and automated tagging.

**Key Features:** Semantic versioning • Automated changelogs • Git tag creation • Monorepo support • Git hooks

```bash
whip bump patch    # Bump patch version
whip bump minor    # Bump minor version
whip changelog     # Generate CHANGELOG.md
```

[Documentation](https://butter-sh.github.io/whip.sh) • [Source](https://github.com/butter-sh/whip.sh)

---

### <img src="https://raw.githubusercontent.com/butter-sh/clean.sh/refs/heads/main/icon.svg" width="32" height="32" style="vertical-align: text-bottom;"> clean.sh — Linter & Formatter

POSIX-compliant bash linter and formatter with AST-based parsing, intelligent rule detection, and automatic code corrections.

**Key Features:** AST-based parsing • Auto-fix formatting • Style enforcement • Context-aware rules • Heredoc preservation

```bash
clean lint script.sh         # Check for issues
clean format script.sh       # Auto-format code
clean check script.sh        # Lint without modify
```

[Documentation](https://butter-sh.github.io/clean.sh) • [Source](https://github.com/butter-sh/clean.sh)

---

## Quick Start

### Installation

Each tool can be installed independently. The recommended approach is to start with **arty.sh** as your dependency manager:

```bash
# Install arty.sh
curl -sSL https://raw.githubusercontent.com/butter-sh/arty.sh/main/arty.sh | sudo tee /usr/local/bin/arty > /dev/null
sudo chmod +x /usr/local/bin/arty

# Initialize your project
arty init my-project
cd my-project

# Add butter.sh tools as dependencies
cat > arty.yml << 'EOF'
name: "my-project"
version: "1.0.0"

references:
  - https://github.com/butter-sh/judge.sh.git
  - https://github.com/butter-sh/myst.sh.git
  - https://github.com/butter-sh/clean.sh.git

scripts:
  test: "arty exec judge run"
  lint: "arty exec clean lint *.sh"
  format: "arty exec clean format *.sh"
EOF

# Install all dependencies
arty deps
```

### System Requirements

- **Bash** 4.0 or higher
- **Git** for repository management
- **yq** for YAML processing ([installation guide](https://github.com/mikefarah/yq))
- **jq** for JSON processing

---

## Integration Example

Here's how the tools work together in a complete development workflow:

```bash
# 1. Create new project with hammer.sh
hammer init awesome-tool

# 2. Configure dependencies in arty.yml
cat > arty.yml << 'EOF'
name: "awesome-tool"
version: "0.1.0"
references:
  - https://github.com/butter-sh/judge.sh.git
  - https://github.com/butter-sh/clean.sh.git
  - https://github.com/butter-sh/leaf.sh.git
  - https://github.com/butter-sh/whip.sh.git
scripts:
  test: "arty exec judge run"
  lint: "arty exec clean lint *.sh"
  format: "arty exec clean format *.sh"
  docs: "arty exec leaf . -o docs/"
  release: "arty exec whip bump"
EOF

# 3. Install dependencies
arty deps

# 4. Write your code
cat > awesome-tool.sh << 'EOF'
#!/usr/bin/env bash
echo "Hello from awesome-tool!"
EOF

# 5. Format and lint
arty format
arty lint

# 6. Write tests
mkdir -p __tests
cat > __tests/test-awesome-tool.sh << 'EOF'
#!/usr/bin/env bash
source "$(dirname "$0")/../test-helpers.sh"

test_hello() {
  output=$(bash awesome-tool.sh)
  assert_contains "$output" "Hello" "Should greet"
}
EOF

# 7. Run tests
arty test

# 8. Generate documentation
arty docs

# 9. Create release
arty release patch
```

---

## Documentation

Complete documentation for all projects is available at [butter-sh.github.io](https://butter-sh.github.io)

Individual project documentation:
- [arty.sh docs](https://butter-sh.github.io/arty.sh)
- [judge.sh docs](https://butter-sh.github.io/judge.sh)
- [myst.sh docs](https://butter-sh.github.io/myst.sh)
- [hammer.sh docs](https://butter-sh.github.io/hammer.sh)
- [leaf.sh docs](https://butter-sh.github.io/leaf.sh)
- [whip.sh docs](https://butter-sh.github.io/whip.sh)
- [clean.sh docs](https://butter-sh.github.io/clean.sh)

---

## Repository Structure

```
butter.sh/
├── projects/              # Individual tool projects
│   ├── arty.sh/          # Dependency manager
│   ├── judge.sh/         # Testing framework
│   ├── myst.sh/          # Templating engine
│   ├── hammer.sh/        # Project scaffolding
│   ├── leaf.sh/          # Documentation generator
│   ├── whip.sh/          # Release management
│   └── clean.sh/         # Linter and formatter
├── docs/                  # Generated documentation
├── _assets/               # Shared assets and styles
├── projects.json          # Project metadata
└── icon.svg               # butter.sh logo
```

---

## Contributing

Contributions are welcome across all projects in the butter.sh ecosystem! Each project has its own repository and issue tracker.

### Development Workflow

1. Fork the project repository
2. Create a feature branch
3. Make your changes with tests
4. Run linter and formatter: `arty format && arty lint`
5. Run test suite: `arty test`
6. Submit a pull request

### Running Tests

```bash
cd projects/<project-name>
../../projects/judge.sh/judge.sh run
```

---

## License

All projects in the butter.sh ecosystem are released under the **MIT License**.

See individual project repositories for license details.

---

<div align="center">

### Crafted with care by [Valknar](https://github.com/valknarogg)

**Unlimited. Independent. Fresh.**

[![GitHub](https://img.shields.io/badge/github-valknarogg-22c55e?style=flat-square&logo=github)](https://github.com/valknarogg)

</div>
