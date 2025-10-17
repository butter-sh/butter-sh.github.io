#!/usr/bin/env bash
#
# Setup script for butter.sh demo recordings
# Makes all demo scripts executable and verifies setup
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🧈 butter.sh Demo Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Make all demo scripts executable
echo "📝 Making demo scripts executable..."
chmod +x "$SCRIPT_DIR"/*.sh
echo "✅ Done"
echo ""

# Check for asciinema
echo "🔍 Checking for asciinema..."
if command -v asciinema &> /dev/null; then
    echo "✅ asciinema is installed ($(asciinema --version))"
else
    echo "⚠️  asciinema is not installed"
    echo ""
    echo "Install it with:"
    echo "  macOS:    brew install asciinema"
    echo "  Ubuntu:   sudo apt-get install asciinema"
    echo "  Fedora:   sudo dnf install asciinema"
    echo "  pip:      pip3 install asciinema"
    echo ""
fi

# List available demos
echo ""
echo "📹 Available demos:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
for demo in "$SCRIPT_DIR"/*-demo.sh; do
    if [ -f "$demo" ]; then
        basename "$demo"
    fi
done

echo ""
echo "📚 Documentation:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  - RECORDING_GUIDE.md: Comprehensive recording guide"
echo "  - DEMO_SUMMARY.md: Overview of all demos"

echo ""
echo "🎬 To record a demo:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  cd $SCRIPT_DIR"
echo "  asciinema rec arty-demo.cast -c './arty-demo.sh'"
echo "  asciinema rec hammer-demo.cast -c './hammer-demo.sh'"
echo "  asciinema rec judge-demo.cast -c './judge-demo.sh'"
echo "  asciinema rec leaf-demo.cast -c './leaf-demo.sh'"
echo "  asciinema rec ecosystem-demo.cast -c './ecosystem-demo.sh'"

echo ""
echo "✨ Setup complete!"
echo ""
