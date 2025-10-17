# 🎬 butter.sh Asciinema Demo Recording Guide

This guide explains how to record and publish the butter.sh ecosystem demos using asciinema.

## 📋 Prerequisites

1. **Install asciinema**:
   ```bash
   # On macOS
   brew install asciinema
   
   # On Ubuntu/Debian
   sudo apt-get install asciinema
   
   # On Fedora
   sudo dnf install asciinema
   
   # Via pip
   pip3 install asciinema
   ```

2. **Create asciinema account** (optional, for publishing):
   ```bash
   asciinema auth
   ```

## 🎥 Recording Demos

### 1. arty.sh Demo

Record the arty.sh demonstration:

```bash
cd butter.sh/profile/demos
chmod +x arty-demo.sh
asciinema rec arty-demo.cast -c "bash arty-demo.sh" --overwrite
```

**What it demonstrates:**
- Installing arty.sh with curl
- Initializing a new project
- Installing libraries from Git
- Managing dependencies with arty.yml
- Executing library scripts
- Listing and removing libraries

**Duration:** ~3-4 minutes

### 2. hammer.sh Demo

Record the hammer.sh demonstration:

```bash
cd butter.sh/profile/demos
chmod +x hammer-demo.sh
asciinema rec hammer-demo.cast -c "bash hammer-demo.sh" --overwrite
```

**What it demonstrates:**
- Installing hammer.sh
- Listing available templates
- Generating projects (starter, arty, leaf, init, judge, icony)
- Using custom variables
- Custom directory targets
- Project structure exploration

**Duration:** ~4-5 minutes

### 3. judge.sh Demo

Record the judge.sh demonstration:

```bash
cd butter.sh/profile/demos
chmod +x judge-demo.sh
asciinema rec judge-demo.cast -c "bash judge-demo.sh" --overwrite
```

**What it demonstrates:**
- Installing judge.sh
- Creating bash functions to test
- Writing test files with assertions
- Running tests with colorful output
- String assertions
- Snapshot testing
- Running multiple test files

**Duration:** ~3-4 minutes

### 4. leaf.sh Demo

Record the leaf.sh demonstration:

```bash
cd butter.sh/profile/demos
chmod +x leaf-demo.sh
asciinema rec leaf-demo.cast -c "bash leaf-demo.sh" --overwrite
```

**What it demonstrates:**
- Installing leaf.sh
- Creating a sample project
- Generating documentation
- Viewing generated HTML structure
- Features of the documentation site

**Duration:** ~3-4 minutes

## 🌐 Publishing to asciinema.org

### Upload recordings:

```bash
# Upload arty demo
asciinema upload arty-demo.cast

# Upload hammer demo
asciinema upload hammer-demo.cast

# Upload judge demo
asciinema upload judge-demo.cast

# Upload leaf demo
asciinema upload leaf-demo.cast
```

### Get the URLs:

After uploading, asciinema will provide URLs like:
- `https://asciinema.org/a/XXXXXX`

### Update README.md:

Replace the placeholder URLs in `/butter.sh/profile/README.md`:

```markdown
<!-- Replace these -->
<a href="https://asciinema.org/a/YOUR-ARTY-DEMO-ID" target="_blank">
<a href="https://asciinema.org/a/YOUR-HAMMER-DEMO-ID" target="_blank">
<a href="https://asciinema.org/a/YOUR-JUDGE-DEMO-ID" target="_blank">
<a href="https://asciinema.org/a/YOUR-LEAF-DEMO-ID" target="_blank">
```

## 🎨 Recording Tips

### Terminal Setup

For best results, configure your terminal before recording:

```bash
# Set optimal terminal size
export COLUMNS=120
export LINES=30

# Use a clean prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Clear any aliases that might interfere
unalias ls 2>/dev/null
unalias cat 2>/dev/null
```

### Recording Settings

```bash
# Optimal settings
asciinema rec demo.cast \
  --cols=120 \
  --rows=30 \
  --title="butter.sh - arty.sh Demo" \
  --idle-time-limit=2 \
  --overwrite
```

### Font and Colors

Use a terminal with good color support:
- **iTerm2** (macOS)
- **GNOME Terminal** (Linux)
- **Windows Terminal** (Windows)

Recommended font: **Fira Code** or **JetBrains Mono**

## 🛠️ Advanced: Custom Timing

If you want to manually control timing, you can edit the `.cast` files:

```bash
# Open the cast file
vim arty-demo.cast
```

The format is JSON with timing information:
```json
[2.0, "o", "$ command\r\n"]
```
- First value: delay in seconds
- Second value: stream type ("o" for output)
- Third value: the text content

## 📝 Post-Recording Checklist

After recording all demos:

- [ ] Verify all recordings play correctly: `asciinema play demo.cast`
- [ ] Check timing and pacing
- [ ] Upload to asciinema.org
- [ ] Update README.md with correct URLs
- [ ] Test embedded players in README
- [ ] Commit cast files to repository (optional)
- [ ] Update demo scripts if needed

## 🎯 Quick Commands Reference

```bash
# Record
asciinema rec demo.cast

# Play locally
asciinema play demo.cast

# Upload
asciinema upload demo.cast

# Record with title
asciinema rec demo.cast -t "My Demo Title"

# Record with size
asciinema rec demo.cast --cols=120 --rows=30

# Record with idle time limit (cuts long pauses)
asciinema rec demo.cast --idle-time-limit=2
```

## 🔄 Updating Demos

To update a demo:

1. Edit the demo script
2. Re-record with `--overwrite` flag
3. Re-upload to asciinema.org
4. Update URL in README if ID changed

## 📊 Best Practices

1. **Keep it short**: Aim for 3-5 minutes per demo
2. **Clear output**: Use colored output for better visibility
3. **Add pauses**: Use `sleep` commands for readability
4. **Show results**: Always show the output of commands
5. **Add context**: Include comments explaining what's happening
6. **Test thoroughly**: Record several times to get it right
7. **Use examples**: Show real-world usage scenarios

## 🎬 Alternative: GIF Creation

If you prefer GIFs instead of asciinema:

```bash
# Install asciicast2gif
npm install -g asciicast2gif

# Convert cast to GIF
asciicast2gif arty-demo.cast arty-demo.gif
```

## 📱 Embedding Options

### In GitHub README:

```markdown
[![asciicast](https://asciinema.org/a/XXXXXX.svg)](https://asciinema.org/a/XXXXXX)
```

### With Custom Size:

```markdown
<a href="https://asciinema.org/a/XXXXXX" target="_blank">
  <img src="https://asciinema.org/a/XXXXXX.svg" width="600"/>
</a>
```

### Self-Hosted Player:

```html
<script src="https://asciinema.org/a/XXXXXX.js" id="asciicast-XXXXXX" async></script>
```

## 🆘 Troubleshooting

### Recording doesn't start:
```bash
# Check asciinema version
asciinema --version

# Try with explicit shell
asciinema rec demo.cast -c /bin/bash
```

### Colors not showing:
```bash
# Force color output
export TERM=xterm-256color
```

### Upload fails:
```bash
# Authenticate first
asciinema auth

# Try again
asciinema upload demo.cast
```

## 📚 Resources

- [asciinema documentation](https://docs.asciinema.org/)
- [asciinema GitHub](https://github.com/asciinema/asciinema)
- [asciicast file format](https://github.com/asciinema/asciinema/blob/develop/doc/asciicast-v2.md)

---

**Happy recording! 🎬✨**

Made with 🧈 by the butter.sh team
