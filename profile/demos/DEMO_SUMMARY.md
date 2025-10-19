# 🎬 butter.sh Demo Summary

This document provides an overview of all demonstration recordings for the butter.sh ecosystem.

## 📋 Demo Recordings

### 1. 📦 arty.sh Demo (`arty-demo.sh`)

**Duration:** ~3-4 minutes  
**Focus:** Library and dependency management

**Key Demonstrations:**
- One-line curl installation
- Project initialization with `arty init`
- Installing libraries from Git repositories
- Managing dependencies via `arty.yml`
- Executing library scripts with `arty exec`
- Listing installed libraries
- Removing libraries

**Target Audience:** Developers who want to manage bash libraries and dependencies

**Recording Command:**
```bash
asciinema rec arty-demo.cast -c './arty-demo.sh' --cols=120 --rows=30
```

---

### 2. 🔨 hammer.sh Demo (`hammer-demo.sh`)

**Duration:** ~4-5 minutes  
**Focus:** Project scaffolding and generation

**Key Demonstrations:**
- Installing hammer.sh
- Listing available templates
- Generating multiple project types:
  - Starter projects
  - Library managers (arty)
  - Documentation generators (leaf)
  - Test frameworks (judge)
  - Project initializers (init)
  - Icon managers (icony)
- Using custom variables for personalization
- Setting custom output directories
- Exploring generated project structure

**Target Audience:** Developers who want to rapidly scaffold bash projects

**Recording Command:**
```bash
asciinema rec hammer-demo.cast -c './hammer-demo.sh' --cols=120 --rows=30
```

---

### 3. 🛡️ judge.sh Demo (`judge-demo.sh`)

**Duration:** ~3-4 minutes  
**Focus:** Testing framework and assertions

**Key Demonstrations:**
- Installing judge.sh from Git
- Creating testable bash functions
- Writing test files with descriptive assertions:
  - `assert_equals`
  - `assert_success`
  - `assert_failure`
  - `assert_contains`
- String assertion tests
- Running single test files
- Running multiple test files
- Beautiful colorful test output

**Target Audience:** Developers who want to test their bash scripts

**Recording Command:**
```bash
asciinema rec judge-demo.cast -c './judge-demo.sh' --cols=120 --rows=30
```

---

### 4. 🍃 leaf.sh Demo (`leaf-demo.sh`)

**Duration:** ~3-4 minutes  
**Focus:** Documentation generation

**Key Demonstrations:**
- Installing leaf.sh
- Creating a sample bash project
- Auto-generating documentation from:
  - README.md
  - Source files (*.sh)
  - LICENSE
  - arty.yml configuration
- Viewing generated documentation structure
- Features showcase:
  - Responsive Tailwind CSS design
  - Syntax highlighting
  - Dark/light theme support
  - Mobile-friendly layout

**Target Audience:** Developers who want professional documentation for their bash projects

**Recording Command:**
```bash
asciinema rec leaf-demo.cast -c './leaf-demo.sh' --cols=120 --rows=30
```

---

### 5. 🎯 Complete Ecosystem Demo (`ecosystem-demo.sh`)

**Duration:** ~6-7 minutes  
**Focus:** How all butter.sh tools work together

**Key Demonstrations:**
- Installing multiple tools (hammer.sh, arty.sh)
- Creating a library project with hammer.sh
- Writing a reusable bash library
- Creating comprehensive tests
- Preparing documentation
- Building a consumer project that uses the library
- Complete dependency management workflow
- Visual project structure
- Benefits of the integrated approach

**Target Audience:** Anyone wanting to see the full power of the butter.sh ecosystem

**Recording Command:**
```bash
asciinema rec ecosystem-demo.cast -c './ecosystem-demo.sh' --cols=120 --rows=30
```

---

## 🎨 Visual Style

All demos feature:
- ✅ Colored output for better visibility
- ✅ Clear command prompts in blue
- ✅ Commentary in yellow
- ✅ Section headers in cyan
- ✅ Strategic pauses for readability
- ✅ ASCII art banners
- ✅ Step-by-step progression

## 📊 Demo Statistics

| Demo | Duration | Commands | Focus Area |
|------|----------|----------|------------|
| arty.sh | 3-4 min | ~12 | Dependencies |
| hammer.sh | 4-5 min | ~15 | Scaffolding |
| judge.sh | 3-4 min | ~10 | Testing |
| leaf.sh | 3-4 min | ~8 | Documentation |
| Ecosystem | 6-7 min | ~20 | Integration |
| **Total** | **~20-24 min** | **~65** | **Complete** |

## 🎯 Recording Checklist

Before recording:
- [ ] Terminal size set to 120x30
- [ ] Clean terminal prompt configured
- [ ] asciinema installed and tested
- [ ] All demo scripts are executable
- [ ] Test run each script manually
- [ ] Verify color output works

During recording:
- [ ] Clear terminal before starting
- [ ] Wait for animations to complete
- [ ] Don't rush through commands
- [ ] Check timing is natural
- [ ] Verify all output is visible

After recording:
- [ ] Review playback: `asciinema play demo.cast`
- [ ] Check for errors or typos
- [ ] Verify timing and pacing
- [ ] Upload to asciinema.org
- [ ] Update README.md with URLs
- [ ] Test embedded player

## 📦 Distribution

### Upload Locations

All recordings should be uploaded to:
1. **asciinema.org** (primary)
   - Public hosting
   - Embeddable player
   - SVG preview generation

2. **GitHub repository** (optional)
   - Version control for `.cast` files
   - Backup and distribution
   - Self-hosting option

### README Integration

Update `/butter.sh/profile/README.md` with:
```markdown
### Installing arty.sh and Managing Dependencies

<a href="https://asciinema.org/a/YOUR-ID" target="_blank">
  <img src="https://asciinema.org/a/YOUR-ID.svg" width="600"/>
</a>
```

## 🔄 Maintenance

### When to Re-record

Re-record demos when:
- Major features are added
- CLI interface changes significantly
- Commands or syntax change
- Better examples are needed
- Timing needs improvement
- Errors are discovered

### Version Tracking

Keep a changelog of demo versions:
```
v1.0 - Initial recordings (2025-10-17)
v1.1 - Updated with new features
v1.2 - Improved timing and clarity
```

## 🎓 Best Practices from Our Demos

1. **Start with context**: Always show the banner and explain what's happening
2. **Use commentary**: Explain each step before executing
3. **Show output**: Always display the results of commands
4. **Pace it right**: Use `sleep` commands strategically
5. **Build complexity**: Start simple, then show advanced features
6. **End with summary**: Recap what was accomplished
7. **Include links**: Direct viewers to documentation

## 🛠️ Technical Details

### Demo Script Structure

Each demo follows this pattern:
```bash
#!/usr/bin/env bash
# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Helper functions
demo() { ... }      # Execute commands with delay
comment() { ... }   # Add commentary
section() { ... }   # Section headers

# Main content
clear
show_banner
section "Step 1"
comment "Explanation"
demo "command"
...
show_summary
```

### Timing Guidelines

- **Command execution**: 1-2 seconds delay before
- **Between commands**: 2 seconds pause
- **Commentary**: 2 seconds display
- **Section headers**: 2 seconds display
- **Banners**: 3 seconds display
- **Final summary**: 3-5 seconds display

## 📚 Related Documentation

- **RECORDING_GUIDE.md**: Detailed recording instructions
- **setup.sh**: Automated setup script
- **README.md**: Main ecosystem documentation

## 🎉 Impact

These demos showcase:
- ✨ The power of the butter.sh ecosystem
- 🚀 How to quickly build bash projects
- 📦 Modern dependency management for bash
- 🧪 Professional testing approaches
- 📚 Automatic documentation generation
- 🔗 Seamless tool integration

## 🤝 Contributing

Improve the demos by:
- Suggesting better examples
- Finding errors or typos
- Proposing new demonstrations
- Improving timing and pacing
- Adding more context
- Creating additional demos

## 📞 Contact

Questions about the demos?
- Open an issue in the repository
- Email: hello@butter.sh
- Discord: Coming soon!

---

**Made with 🧈 by the butter.sh team**

*These demos help developers discover the power of modern bash development!*
