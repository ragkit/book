# Read up on just here: https://github.com/casey/just

set fallback := true
set shell := ["bash", "-uc"]
set windows-shell := ["sh", "-uc"]

# `just --list` (or just `just`) will print all the recipes in the current
# Justfile. `just RECIPE` will run the macro/job.
_default:
  @just --list

# Install required packages.
install:
  pnpm install

# Builds everything (basically `cargo build`).
build:
  mdbook build

# Test everything (basically `cargo test`).
test:
  mdbook test

# Typically doesn't need to be run.
# Format in editor/on commit should do this automatically.
format:
  cargo fmt
  pnpm format

# Checks formatting for ci.
format-ci:
  cargo fmt --check
  pnpm format:check

# Serves the book locally.
serve:
  mdbook serve -o -p 5000
