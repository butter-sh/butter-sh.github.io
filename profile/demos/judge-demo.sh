#!/usr/bin/env bash
#
# Demonstration script for judge.sh
# Record this with: asciinema rec judge-demo.cast -c "bash judge-demo.sh"
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
echo -e "${GREEN}║    🛡️ butter.sh Ecosystem - judge.sh Demo             ║${NC}"
echo -e "${GREEN}║    Bash Testing Framework                             ║${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
sleep 3

comment "Install judge.sh - the testing framework"
demo "git clone https://github.com/butter-sh/judge.sh.git"
demo "cd judge.sh && sudo make install"

comment "Create a simple bash function to test"
mkdir -p ~/test-demo && cd ~/test-demo
cat > math_utils.sh << 'EOF'
#!/usr/bin/env bash

# Simple math utility functions
add() {
    echo $(($1 + $2))
}

multiply() {
    echo $(($1 * $2))
}

is_even() {
    [[ $(($1 % 2)) -eq 0 ]]
}
EOF

demo "cat math_utils.sh"

comment "Create test file with assertions"
cat > test_math.sh << 'EOF'
#!/usr/bin/env bash
source judge.sh
source math_utils.sh

describe "Math utilities"
  
  it "should add two numbers"
    result=$(add 2 3)
    assert_equals 5 "$result"
  ti
  
  it "should multiply two numbers"
    result=$(multiply 4 5)
    assert_equals 20 "$result"
  ti
  
  it "should check if number is even"
    is_even 4
    assert_success
    
    is_even 5
    assert_failure
  ti
  
  it "should handle negative numbers"
    result=$(add -5 3)
    assert_equals -2 "$result"
  ti

ebed

describe "Edge cases"
  
  it "should handle zero"
    result=$(add 0 0)
    assert_equals 0 "$result"
  ti
  
  it "should handle large numbers"
    result=$(multiply 1000 1000)
    assert_equals 1000000 "$result"
  ti

ebed
EOF

demo "cat test_math.sh"

comment "Run the tests"
demo "judge test test_math.sh"

comment "Create a test with string assertions"
cat > test_strings.sh << 'EOF'
#!/usr/bin/env bash
source judge.sh

describe "String operations"
  
  it "should check string equality"
    greeting="Hello, World!"
    assert_equals "Hello, World!" "$greeting"
  ti
  
  it "should check string contains"
    message="butter.sh is awesome"
    assert_contains "butter" "$message"
    assert_contains "awesome" "$message"
  ti
  
  it "should check string length"
    word="bash"
    assert_equals 4 ${#word}
  ti

ebed
EOF

demo "cat test_strings.sh"
demo "judge test test_strings.sh"

comment "Create a test demonstrating snapshot testing"
cat > test_output.sh << 'EOF'
#!/usr/bin/env bash
source judge.sh

describe "Command output"
  
  it "should match expected output"
    output=$(echo -e "Line 1\nLine 2\nLine 3")
    expected="Line 1
Line 2
Line 3"
    assert_equals "$expected" "$output"
  ti
  
  it "should capture ls output"
    # Create test files
    mkdir -p test_dir
    touch test_dir/file1.txt test_dir/file2.txt
    output=$(ls test_dir)
    assert_contains "file1.txt" "$output"
    assert_contains "file2.txt" "$output"
    rm -rf test_dir
  ti

ebed
EOF

demo "judge test test_output.sh"

comment "Run all tests together"
demo "judge test test_*.sh"

comment "View test statistics"
demo "judge test --verbose test_math.sh"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}║    ✨ judge.sh Demo Complete!                         ║${NC}"
echo -e "${GREEN}║    Learn more: https://butter-sh.github.io/judge.sh   ║${NC}"
echo -e "${GREEN}║                                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
sleep 3
