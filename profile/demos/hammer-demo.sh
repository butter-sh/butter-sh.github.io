#!/usr/bin/env bash
#
# Demonstration script for hammer.sh
# Record this with: asciinema rec hammer-demo.cast -c "bash hammer-demo.sh"
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
echo -e "${GREEN}║    🔨 butter.sh Ecosystem - hammer.sh Demo            ║${NC}"
echo -e "${GREEN}║    Project Scaffolding & Generation                   ║${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
sleep 3

comment "Install hammer.sh - the project generator"
demo "curl -sSL https://raw.githubusercontent.com/butter-sh/hammer.sh/main/hammer.sh | sudo tee /usr/local/bin/hammer > /dev/null"
demo "sudo chmod +x /usr/local/bin/hammer"

comment "List available templates"
demo "hammer --list"

comment "Generate a basic starter project"
demo "hammer starter my-starter-app"
demo "cd my-starter-app && ls -la"
demo "cat README.md"

comment "Go back and create a library manager project"
demo "cd .. && hammer arty my-library-manager"
demo "cd my-library-manager && ls -la"

comment "Generate with custom variables"
demo "cd .. && hammer starter my-custom-app -v author=\"John Doe\" -v license=MIT -v email=\"john@example.com\""
demo "cd my-custom-app && cat arty.yml"

comment "Create a documentation generator project"
demo "cd .. && hammer leaf my-docs-generator"
demo "cd my-docs-generator && ls -la"

comment "Generate a test framework project"
demo "cd .. && hammer judge test-framework"
demo "cd test-framework && ls -la"

comment "Generate with custom directory"
demo "cd .. && hammer starter special-project --dir ./custom-projects"
demo "ls -la custom-projects/"

comment "Create an init project for project initialization"
demo "hammer init project-initializer"
demo "cd project-initializer && ./init.sh --help"

comment "Create an icon manager"
demo "cd .. && hammer icony my-icon-manager"
demo "cd my-icon-manager && ls -la"

comment "Show project structure"
demo "cd .. && tree -L 2 -a my-starter-app"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}║    ✨ hammer.sh Demo Complete!                        ║${NC}"
echo -e "${GREEN}║    Learn more: https://butter-sh.github.io/hammer.sh  ║${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
sleep 3
