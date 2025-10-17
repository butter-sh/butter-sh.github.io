# 🧈 butter.sh Profile - Quick Start

Welcome to the butter.sh GitHub profile! This guide will help you get started with creating and recording amazing demos for the ecosystem.

## 📁 What's in This Directory

```
profile/
├── README.md                    # Main profile README (the awesome one!)
└── demos/                       # Demo recordings
    ├── setup.sh                 # Setup script (run this first!)
    ├── arty-demo.sh             # arty.sh demonstration
    ├── hammer-demo.sh           # hammer.sh demonstration
    ├── judge-demo.sh            # judge.sh demonstration
    ├── leaf-demo.sh             # leaf.sh demonstration
    ├── ecosystem-demo.sh        # Complete ecosystem demo
    ├── RECORDING_GUIDE.md       # Comprehensive recording guide
    └── DEMO_SUMMARY.md          # Overview of all demos
```

## 🚀 Quick Setup (30 seconds)

```bash
# 1. Navigate to demos directory
cd butter.sh/profile/demos

# 2. Run setup script
bash setup.sh

# 3. You're ready to record!
```

## 🎬 Record Your First Demo

### Option 1: Record arty.sh Demo

```bash
cd butter.sh/profile/demos
asciinema rec arty-demo.cast -c './arty-demo.sh' --cols=120 --rows=30
```

### Option 2: Record the Complete Ecosystem Demo

```bash
cd butter.sh/profile/demos
asciinema rec ecosystem-demo.cast -c './ecosystem-demo.sh' --cols=120 --rows=30
```

## 📤 Upload and Share

After recording:

```bash
# Upload to asciinema.org
asciinema upload arty-demo.cast

# Copy the URL you receive (like https://asciinema.org/a/ABC123)

# Update README.md with the new URL
# Replace placeholder URLs in butter.sh/profile/README.md
```

## 🎨 Customize the README

The main `README.md` includes:

- ✅ Butter.sh logo (cube icon)
- ✅ Stylish badges for all projects
- ✅ Custom butter.sh branded badges
- ✅ Asciinema demo placeholders
- ✅ Project cards with links
- ✅ Complete ecosystem overview
- ✅ Installation instructions
- ✅ Example workflows

### Update Badges

The badges automatically pull from GitHub:
- Build status from GitHub Actions
- Version from Git tags
- Custom butter.sh cube badges

### Update Demo Links

Find and replace in `README.md`:
```markdown
<!-- Current placeholder -->
<a href="https://asciinema.org/a/butter-arty-demo" target="_blank">

<!-- Replace with your actual asciinema URL -->
<a href="https://asciinema.org/a/YOUR-ACTUAL-ID" target="_blank">
```

## 🎯 Badge Customization

### Current Badges

Each project has:
1. **GitHub Actions Badge**: Build status
2. **Version Badge**: Current Git tag
3. **butter.sh Badge**: Custom branded badge with cube icon

### Add More Badges

```markdown
<!-- Code Coverage -->
[![Coverage](https://img.shields.io/codecov/c/github/butter-sh/PROJECT?style=flat-square)](https://codecov.io/gh/butter-sh/PROJECT)

<!-- Downloads -->
[![Downloads](https://img.shields.io/github/downloads/butter-sh/PROJECT/total?style=flat-square&color=4ade80)](https://github.com/butter-sh/PROJECT/releases)

<!-- Last Commit -->
[![Last Commit](https://img.shields.io/github/last-commit/butter-sh/PROJECT?style=flat-square&color=22c55e)](https://github.com/butter-sh/PROJECT/commits)

<!-- Issues -->
[![Issues](https://img.shields.io/github/issues/butter-sh/PROJECT?style=flat-square&color=86efac)](https://github.com/butter-sh/PROJECT/issues)

<!-- Pull Requests -->
[![PRs](https://img.shields.io/github/issues-pr/butter-sh/PROJECT?style=flat-square&color=4ade80)](https://github.com/butter-sh/PROJECT/pulls)
```

## 🎨 Icon Customization

The butter.sh cube icon is located at:
```
butter.sh/_assets/brand/cube-carbon-light.svg
```

To use it in the README:
```markdown
<img src="https://raw.githubusercontent.com/butter-sh/butter.sh/main/_assets/brand/cube-carbon-light.svg" width="120">
```

## 📊 Make It Dynamic

### Add GitHub Stats

```markdown
![GitHub Stats](https://github-readme-stats.vercel.app/api?username=butter-sh&show_icons=true&theme=radical)
```

### Add Star History

```markdown
[![Star History](https://api.star-history.com/svg?repos=butter-sh/arty.sh,butter-sh/hammer.sh&type=Date)](https://star-history.com)
```

### Add Contributors

```markdown
[![Contributors](https://contrib.rocks/image?repo=butter-sh/arty.sh)](https://github.com/butter-sh/arty.sh/graphs/contributors)
```

## 🎭 Demo Tips

### Before Recording

1. **Clean your terminal**
   ```bash
   clear
   export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
   ```

2. **Set optimal size**
   ```bash
   # Most readable size for demos
   resize -s 30 120
   ```

3. **Test the script**
   ```bash
   bash ./arty-demo.sh  # Test without recording
   ```

### During Recording

- ✅ Speak slowly if adding voice-over
- ✅ Let animations complete
- ✅ Don't rush commands
- ✅ Check that all output is visible
- ✅ Verify colors display correctly

### After Recording

```bash
# Review the recording
asciinema play arty-demo.cast

# If good, upload
asciinema upload arty-demo.cast

# If needs work, re-record with --overwrite
asciinema rec arty-demo.cast -c './arty-demo.sh' --overwrite
```

## 📝 Checklist for Profile Setup

- [ ] Run `demos/setup.sh`
- [ ] Record all 5 demos
- [ ] Upload demos to asciinema.org
- [ ] Update README.md with demo URLs
- [ ] Verify badges work for all projects
- [ ] Test all links in README
- [ ] Check icon displays correctly
- [ ] Verify mobile responsiveness
- [ ] Preview README on GitHub
- [ ] Share with the team!

## 🎉 You're Done!

Your butter.sh profile is now:
- ✨ Professional and polished
- 🎬 Has interactive demos
- 📊 Shows live badges
- 🎨 Features beautiful branding
- 📚 Comprehensively documented

## 🆘 Need Help?

- 📖 Read `demos/RECORDING_GUIDE.md` for detailed instructions
- 📋 Check `demos/DEMO_SUMMARY.md` for demo overview
- 🐛 Open an issue if you find problems
- 💬 Ask in Discord (coming soon!)

## 🔗 Useful Links

- [asciinema documentation](https://docs.asciinema.org/)
- [Shields.io badge generator](https://shields.io/)
- [GitHub README best practices](https://github.com/matiassingers/awesome-readme)
- [Markdown cheat sheet](https://www.markdownguide.org/cheat-sheet/)

---

**Made with 🧈 by the butter.sh team**

*Now go create something awesome!* ✨
