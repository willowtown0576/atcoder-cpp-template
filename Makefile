SHELL := /bin/bash

CXX := g++
CXXFLAGS := -std=gnu++23 -O2 -Wall -Wextra -pthread -DONLINE_JUDGE
LDFLAGS :=

SRC ?= Main.cpp
BIN ?= a.out

# contests配下に acc new で作る想定
CONTESTSDIR := /workspace/contests

.PHONY: help init login new \
        build run test submit clean \
        build-in test-in submit-in

help:
	@echo ""
	@echo "===== AtCoder C++ Makefile ====="
	@echo ""
	@echo "[First time]"
	@echo "  make login                       # aclogin"
	@echo ""
	@echo "[Create contest]"
	@echo "  make new CONTEST=abc350           # create contests/abc350/{a..}"
	@echo ""
	@echo "[In problem dir (recommended)]"
	@echo "  make build / test / submit"
	@echo ""
	@echo "[From repo root]"
	@echo "  make build-in DIR=contests/abc350/a"
	@echo "  make test-in  DIR=contests/abc350/a"
	@echo "  make submit-in DIR=contests/abc350/a"
	@echo ""

init:
	@mkdir -p $(CONTESTSDIR)

login:
	@aclogin

new: init
	@test -n "$(CONTEST)" || (echo "CONTEST=abcXXX を指定してください"; exit 1)
	@cd $(CONTESTSDIR) && acc new $(CONTEST)

# --- problem dir targets ---
build:
	@$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BIN) $(SRC)

run:
	@./$(BIN)

test:
	@oj test -c "./$(BIN)" -d test

submit:
	@acc submit "$(SRC)"

clean:
	@rm -f $(BIN)

# --- run targets from anywhere ---
build-in:
	@test -n "$(DIR)" || (echo "DIR=contests/xxx/a を指定してください"; exit 1)
	@$(MAKE) -C /workspace/$(DIR) build

test-in:
	@test -n "$(DIR)" || (echo "DIR=contests/xxx/a を指定してください"; exit 1)
	@$(MAKE) -C /workspace/$(DIR) test

submit-in:
	@test -n "$(DIR)" || (echo "DIR=contests/xxx/a を指定してください"; exit 1)
	@$(MAKE) -C /workspace/$(DIR) submit
