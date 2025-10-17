#!/usr/bin/env bash
#
# Complete butter.sh Ecosystem Demo
# Shows how all tools work together
# Record this with: asciinema rec ecosystem-demo.cast -c "bash ecosystem-demo.sh"
#

# Colors for better visibility
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Function to print and execute commands with delay
demo() {
    echo -e "${BLUE}$ ${NC}$1"
    sleep 1
    eval "$1"
    sleep 2
}

# Function to print commentary
comment() {
    echo -e "${YELLOW}# $1${NC}"
    sleep 2
}

# Function to print section headers
section() {
    echo ""
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  $1${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════╝${NC}"
    echo ""
    sleep 2
}

clear

echo -e "${GREEN}"
cat << 'EOF'
    ____        __  __                  __  
   / __ )__  __/ /_/ /____  _____   ___/ /_ 
  / __  / / / / __/ __/ _ \/ ___/  / ___/ /_
 / /_/ / /_/ / /_/ /_/  __/ /  _  (__  ) __ \
/_____/\__,_/\__/\__/\___/_/  (_)/____/_/ /_/
                                              
    🧈 Unlimited. Independent. Fresh.
EOF
echo -e "${NC}"
sleep 3

section "1️⃣  Setting Up the Ecosystem"

comment "Install hammer.sh - Project Generator"
demo "curl -sSL https://raw.githubusercontent.com/butter-sh/hammer.sh/main/hammer.sh | sudo tee /usr/local/bin/hammer > /dev/null"
demo "sudo chmod +x /usr/local/bin/hammer"

comment "Install arty.sh - Library Manager"
demo "curl -sSL https://raw.githubusercontent.com/butter-sh/arty.sh/main/arty.sh | sudo tee /usr/local/bin/arty > /dev/null"
demo "sudo chmod +x /usr/local/bin/arty"

comment "Verify installations"
demo "hammer --version 2>/dev/null || echo 'hammer.sh installed'"
demo "arty --version 2>/dev/null || echo 'arty.sh installed'"

section "2️⃣  Generate a New Library Project"

comment "Use hammer.sh to scaffold a new bash library"
demo "hammer arty awesome-math-lib"
demo "cd awesome-math-lib"
demo "ls -la"

comment "Create our awesome math library"
cat > awesome-math-lib.sh << 'EOF'
#!/usr/bin/env bash
#
# Awesome Math Library
# Part of the butter.sh ecosystem demo
#

# Add two numbers
math_add() {
    echo $(($1 + $2))
}

# Multiply two numbers
math_multiply() {
    echo $(($1 * $2))
}

# Calculate power
math_power() {
    local base=$1
    local exp=$2
    local result=1
    for ((i=0; i<exp; i++)); do
        result=$((result * base))
    done
    echo $result
}

# Show library info
math_info() {
    echo "🧈 Awesome Math Library v1.0.0"
    echo "Part of the butter.sh ecosystem"
    echo ""
    echo "Available functions:"
    echo "  - math_add <a> <b>"
    echo "  - math_multiply <a> <b>"
    echo "  - math_power <base> <exp>"
}

# If called directly, show info
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    math_info
fi
EOF

demo "cat awesome-math-lib.sh"

comment "Update arty.yml configuration"
cat > arty.yml << 'EOF'
name: "awesome-math-lib"
version: "1.0.0"
description: "An awesome math library built with butter.sh"
author: "butter.sh team"
license: "MIT"

main: "awesome-math-lib.sh"

scripts:
  test: "bash tests/test_math.sh"
  demo: "bash examples/demo.sh"
EOF

demo "cat arty.yml"

section "3️⃣  Add Tests with judge.sh"

comment "Create a test directory"
demo "mkdir -p tests"

comment "Write comprehensive tests"
cat > tests/test_math.sh << 'EOF'
#!/usr/bin/env bash
source ../judge.sh 2>/dev/null || source judge.sh
source ../awesome-math-lib.sh

describe "Awesome Math Library Tests"
  
  it "should add numbers correctly"
    result=$(math_add 5 3)
    assert_equals 8 "$result"
  ti
  
  it "should multiply numbers"
    result=$(math_multiply 4 7)
    assert_equals 28 "$result"
  ti
  
  it "should calculate powers"
    result=$(math_power 2 10)
    assert_equals 1024 "$result"
  ti
  
  it "should handle zero"
    result=$(math_add 0 0)
    assert_equals 0 "$result"
  ti
  
  it "should handle negative numbers"
    result=$(math_add -5 3)
    assert_equals -2 "$result"
  ti

ebed

describe "Edge Cases"
  
  it "should handle large numbers"
    result=$(math_multiply 1000 1000)
    assert_equals 1000000 "$result"
  ti

ebed

echo "✅ All tests passed!"
EOF

demo "cat tests/test_math.sh"

comment "Note: In real usage, you would run: judge test tests/test_math.sh"
echo "  (Skipping actual test execution in demo)"
sleep 2

section "4️⃣  Create Documentation with leaf.sh"

comment "Create a comprehensive README"
cat > README.md << 'EOF'
# 🧮 Awesome Math Library

A powerful and simple math library for bash, built with the butter.sh ecosystem.

## 🌟 Features

- ➕ Addition
- ✖️ Multiplication  
- 🔢 Power calculations
- 🧪 Fully tested with judge.sh
- 📦 Managed with arty.sh
- 📚 Auto-documented with leaf.sh

## 📦 Installation

Using arty.sh:

```bash
arty install https://github.com/your-org/awesome-math-lib.git
```

## 🚀 Usage

```bash
#!/usr/bin/env bash
source <(arty source awesome-math-lib)

# Add numbers
result=$(math_add 10 20)
echo "10 + 20 = $result"

# Multiply
result=$(math_multiply 5 6)
echo "5 × 6 = $result"

# Calculate power
result=$(math_power 2 8)
echo "2^8 = $result"
```

## 🧪 Testing

Tests are written with judge.sh:

```bash
judge test tests/test_math.sh
```

## 📚 Documentation

Generate docs with leaf.sh:

```bash
leaf.sh .
open docs/index.html
```

## 🤝 Contributing

Built with 🧈 butter.sh ecosystem

## 📄 License

MIT License
EOF

demo "cat README.md"

comment "Generate beautiful documentation"
echo "  In real usage: leaf.sh ."
echo "  This creates a stunning documentation website!"
sleep 2

section "5️⃣  Create a Consumer Project"

comment "Go back and create a project that uses our library"
demo "cd .."
demo "hammer starter math-calculator"
demo "cd math-calculator"

comment "Configure to use our awesome-math-lib"
cat > arty.yml << 'EOF'
name: "math-calculator"
version: "0.1.0"
description: "A calculator using awesome-math-lib"

references:
  - ../awesome-math-lib

main: "calculator.sh"

scripts:
  start: "bash calculator.sh"
EOF

demo "cat arty.yml"

comment "Install dependencies"
echo "  In real usage: arty deps"
echo "  This installs all referenced libraries"
sleep 2

comment "Create the calculator application"
cat > calculator.sh << 'EOF'
#!/usr/bin/env bash
#
# Math Calculator
# Built with butter.sh ecosystem
#

# Source our library
source <(arty source awesome-math-lib) 2>/dev/null || {
    # Fallback for demo
    source ../awesome-math-lib/awesome-math-lib.sh
}

echo "🧮 Math Calculator"
echo "Built with 🧈 butter.sh"
echo ""

# Demo calculations
echo "Addition: 15 + 27 = $(math_add 15 27)"
echo "Multiplication: 12 × 8 = $(math_multiply 12 8)"
echo "Power: 3^4 = $(math_power 3 4)"
echo ""

echo "✨ All calculations powered by awesome-math-lib!"
EOF

demo "cat calculator.sh"

comment "Run the calculator"
demo "bash calculator.sh"

section "6️⃣  The Complete Workflow"

echo -e "${MAGENTA}"
cat << 'EOF'
🎯 What we've accomplished:

1. ✅ Generated a library project with hammer.sh
2. ✅ Created a reusable bash library
3. ✅ Wrote comprehensive tests (ready for judge.sh)
4. ✅ Created documentation (ready for leaf.sh)
5. ✅ Built a consumer project
6. ✅ Integrated everything with arty.sh

This is the power of the butter.sh ecosystem:
  🔨 hammer.sh  → Generate projects
  📦 arty.sh    → Manage dependencies
  🛡️ judge.sh   → Test your code
  🍃 leaf.sh    → Document everything
  ⚡ init.sh    → Initialize projects
  💧 icony.sh   → Manage assets
EOF
echo -e "${NC}"
sleep 5

section "7️⃣  Real-World Integration"

comment "Show how everything connects"
echo -e "${CYAN}Project Structure:${NC}"
cat << 'EOF'
workspace/
├── awesome-math-lib/          ← Generated with hammer.sh
│   ├── awesome-math-lib.sh    ← The library
│   ├── arty.yml               ← arty.sh config
│   ├── tests/                 ← Tests for judge.sh
│   │   └── test_math.sh
│   ├── docs/                  ← Generated by leaf.sh
│   │   └── index.html
│   └── README.md
│
└── math-calculator/           ← Consumer project
    ├── calculator.sh          ← Uses the library
    ├── arty.yml               ← References the library
    └── README.md
EOF
sleep 4

comment "Benefits of this approach:"
echo "  🚀 Rapid development with scaffolding"
echo "  📦 Clean dependency management"
echo "  🧪 Comprehensive testing"
echo "  📚 Beautiful documentation"
echo "  🔄 Reusable components"
echo "  🧈 All in pure bash!"
sleep 4

section "🎬 Demo Complete!"

echo -e "${GREEN}"
cat << 'EOF'
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║         🧈 butter.sh Ecosystem Demo                   ║
║                                                       ║
║         Unlimited. Independent. Fresh.                ║
║                                                       ║
║    Learn more:                                        ║
║    → https://github.com/butter-sh                     ║
║    → https://butter.sh                                ║
║                                                       ║
║    Star us on GitHub! ⭐                              ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"
sleep 3

comment "Quick command reference:"
echo ""
echo -e "${BLUE}hammer --list${NC}           # List templates"
echo -e "${BLUE}hammer <template> <name>${NC} # Generate project"
echo -e "${BLUE}arty init <name>${NC}        # Initialize arty project"
echo -e "${BLUE}arty install <url>${NC}      # Install library"
echo -e "${BLUE}arty deps${NC}               # Install dependencies"
echo -e "${BLUE}judge test <file>${NC}       # Run tests"
echo -e "${BLUE}leaf.sh <path>${NC}          # Generate docs"
echo ""
sleep 3

echo "Thanks for watching! 🎉"
sleep 2
