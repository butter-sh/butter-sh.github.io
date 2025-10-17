#!/usr/bin/env bash
#
# Demonstration script for arty.sh
# Record this with: asciinema rec arty-demo.cast -c "bash arty-demo.sh"
#

# Colors for better visibility
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
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

clear

echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}║    🧈 butter.sh Ecosystem - arty.sh Demo             ║${NC}"
echo -e "${GREEN}║    Bash Library Package Manager                       ║${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
sleep 3

comment "Let's install arty.sh - the bash library manager"
demo "curl -sSL https://raw.githubusercontent.com/butter-sh/arty.sh/main/arty.sh | sudo tee /usr/local/bin/arty > /dev/null"
demo "sudo chmod +x /usr/local/bin/arty"

comment "Verify installation"
demo "arty --version"

comment "Initialize a new project"
demo "mkdir my-awesome-project && cd my-awesome-project"
demo "arty init my-awesome-project"

comment "View the generated arty.yml configuration"
demo "cat arty.yml"

comment "Install a library from a Git repository"
demo "arty install https://github.com/butter-sh/kompose.sh.git"

comment "List installed libraries"
demo "arty list"

comment "Add dependencies to arty.yml"
cat > arty.yml << 'EOF'
name: "my-awesome-project"
version: "1.0.0"
description: "A project using butter.sh ecosystem"

references:
  - https://github.com/butter-sh/kompose.sh.git
  - https://github.com/user/logger.git

main: "main.sh"

scripts:
  test: "bash test.sh"
  start: "bash main.sh"
EOF

demo "cat arty.yml"

comment "Install all dependencies from arty.yml"
demo "arty deps"

comment "Execute a library's main script"
demo "arty exec kompose --help"

comment "Create a main script that uses an installed library"
cat > main.sh << 'EOF'
#!/usr/bin/env bash

# Source the library using arty
source <(arty source kompose)

echo "🧈 Using butter.sh ecosystem!"
echo "Libraries installed and ready to use!"
EOF

demo "cat main.sh"
demo "bash main.sh"

comment "Remove a library"
demo "arty remove kompose"
demo "arty list"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}║    ✨ arty.sh Demo Complete!                          ║${NC}"
echo -e "${GREEN}║    Learn more: https://butter-sh.github.io/arty.sh    ║${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
sleep 3
