#!/bin/bash

# 🧪 Suite de Pruebas Automatizadas (Unit, Integration & Smoke Tests)
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

PASSED=0
FAILED=0

assert_exit_code() {
    local expected=$1
    shift
    local cmd="$*"
    
    set +e
    eval "$cmd" > /dev/null 2>&1
    local status=$?
    set -e
    
    if [ "$status" -eq "$expected" ]; then
        echo -e "${GREEN}✓ [PASS]${NC} Command: '$cmd' returned exit code $expected"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}✗ [FAIL]${NC} Command: '$cmd' returned exit code $status, expected $expected"
        FAILED=$((FAILED + 1))
    fi
}

assert_output_contains() {
    local expected_text=$1
    shift
    local cmd="$*"
    
    local output
    output=$(eval "$cmd" 2>&1)
    
    if echo "$output" | grep -F -q "$expected_text"; then
        echo -e "${GREEN}✓ [PASS]${NC} Output of '$cmd' contains '$expected_text'"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}✗ [FAIL]${NC} Output of '$cmd' missing '$expected_text'"
        echo "Actual output:"
        echo "$output"
        FAILED=$((FAILED + 1))
    fi
}

echo "=========================================="
echo "🚀 Ejecutando Suite de Pruebas QA"
echo "=========================================="

# 1. SMOKE TESTS
echo ""
echo "--- 1. SMOKE TESTS ---"
assert_exit_code 0 "./generate-assets.sh --help"
assert_output_contains "GitHub Profile Asset Generator" "./generate-assets.sh --help"
assert_exit_code 0 "./git_sync.sh --help"
assert_output_contains "Uso: ./git_sync.sh" "./git_sync.sh --help"

# 2. UNIT / INTEGRATION TESTS: generate-assets.sh
echo ""
echo "--- 2. UNIT / INTEGRATION TESTS ---"

# Test argument validation
assert_exit_code 1 "./generate-assets.sh screenshot"
assert_exit_code 1 "./generate-assets.sh badges"
assert_exit_code 1 "./generate-assets.sh diagram"
assert_exit_code 1 "./generate-assets.sh invalid_command"

# Test project option parsing (-p and positional)
assert_output_contains "CodeAgent" "./generate-assets.sh screenshot -p CodeAgent"
assert_output_contains "codeagent-*.png" "./generate-assets.sh screenshot -p CodeAgent"
assert_output_contains "GitSpy" "./generate-assets.sh screenshot GitSpy"

# Test diagram generation
mkdir -p .github/assets/diagrams

assert_exit_code 0 "./generate-assets.sh diagram -p TestProject"
if [ -f .github/assets/diagrams/testproject-architecture.mmd ]; then
    echo -e "${GREEN}✓ [PASS]${NC} Diagram file created: .github/assets/diagrams/testproject-architecture.mmd"
    PASSED=$((PASSED + 1))
    rm -f .github/assets/diagrams/testproject-architecture.mmd
else
    echo -e "${RED}✗ [FAIL]${NC} Diagram file not created"
    FAILED=$((FAILED + 1))
fi

# Test project audit scanner
assert_output_contains "fraudsense" "./generate-assets.sh check"
assert_output_contains "netopstoolkit" "./generate-assets.sh check"
assert_output_contains "finlogic" "./generate-assets.sh check"
assert_output_contains "codeagent" "./generate-assets.sh check"
assert_output_contains "dataprep" "./generate-assets.sh check"
assert_output_contains "documind" "./generate-assets.sh check"

echo ""
echo "=========================================="
echo "📊 Resumen de Pruebas: $PASSED pasadas, $FAILED fallidas"
echo "=========================================="

if [ "$FAILED" -ne 0 ]; then
    exit 1
fi
