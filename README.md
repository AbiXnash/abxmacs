# Emacs Configuration

Personal Emacs setup with Gruvbox styling, Ivy/Counsel minibuffer completion, LSP-based IDE features, and a few Neovim-like QoL tools.

## Install

Clone to `~/.emacs.d`:

```bash
git clone <your-repo> ~/.emacs.d
```

Restart Emacs. Packages are installed automatically on first load.

## What This Config Does

- Gruvbox dark theme
- Doom modeline
- Relative line numbers
- Transparent frame background
- Ivy + Counsel + Ivy Rich for minibuffer completion
- Projectile for project awareness
- Magit for Git
- LSP + LSP UI for IDE behavior
- Company for autocomplete
- Flycheck for diagnostics
- Format-all for format-on-save
- Helpful for better help buffers
- Avy, Ace Window, Vundo, Diff HL, and Dired Subtree for navigation/QoL

## IDE Features

### LSP

LSP starts automatically for:

- Go
- Lua
- JavaScript
- TypeScript
- JSON
- Python
- Rust
- Zig
- C
- C++

Extra Lua behavior:

- Love2D projects are detected automatically
- Love2D projects switch LuaLS to `LuaJIT`
- `love` is added as a known global
- LuaLS loads the bundled Love2D metadata library

### Completion

- `company-mode` is enabled globally for programming buffers
- completions start at 1 character
- tooltip/doc/preview styling is transparent to match the frame
- `yasnippet` is enabled globally
- `yasnippet-snippets` is installed

### Diagnostics

- `flycheck-mode` runs globally
- diagnostics check on save, newline, idle change, and mode enable
- LSP diagnostics are routed through Flycheck

### Formatting

- `format-all-mode` is enabled for programming buffers
- formatting runs automatically on save
- manual formatting command is available via:

```text
M-x format-all-buffer-or-region
```

Configured formatters:

- Go: `gofmt`
- Lua: `stylua`
- Python: `black`
- Rust: `rustfmt`
- Zig: `zig fmt`
- C/C++: `clang-format`
- JavaScript/TypeScript/JSON/CSS/SCSS/Markdown/YAML: `prettier`
- HTML: `tidy`
- Shell: `shfmt`

## UI

- theme: `gruvbox-dark-hard`
- frame opacity: `85`
- hidden scroll bar, tool bar, menu bar, tooltips
- relative line numbers
- current-line highlight
- matching parens highlight
- Doom modeline with Git, position, env, diagnostics, and LSP state

## Keymaps

### Core

| Key | Binding |
|-----|---------|
| `M-x` | `counsel-M-x` |
| `C-x C-f` | `counsel-find-file` |
| `C-x b` | `ivy-switch-buffer` |
| `C-h k` | `helpful-key` |

### Help

These are remapped by `helpful`:

| Key | Binding |
|-----|---------|
| `C-h f` | `helpful-callable` |
| `C-h v` | `helpful-variable` |
| `C-h k` | `helpful-key` |

### Navigation

| Key | Binding |
|-----|---------|
| `M-j` | `avy-goto-char-timer` |
| `M-g l` | `avy-goto-line` |
| `M-g w` | `avy-goto-word-1` |
| `M-o` | `ace-window` |

### Undo / File Tree

| Key | Binding |
|-----|---------|
| `C-x u` | `vundo` |
| `TAB` in `dired-mode` | `dired-subtree-toggle` |
| `S-TAB` in `dired-mode` | `dired-subtree-cycle` |

### Company Completion

When the Company popup is active:

| Key | Binding |
|-----|---------|
| `M-/` | complete |
| `C-n` | next candidate |
| `C-p` | previous candidate |
| `C-d` | show docs |

### Flycheck

| Key | Binding |
|-----|---------|
| `M-n` | next error |
| `M-p` | previous error |

### LSP

LSP prefix:

| Key | Binding |
|-----|---------|
| `C-c l` | LSP command prefix |

Useful LSP behavior already enabled:

- hover docs
- sideline diagnostics
- sideline code actions
- headerline breadcrumbs
- transparent hover/doc frame
- symbol reference underline highlighting

## QoL Additions

These were added specifically to mirror some common Neovim workflows:

- `avy`: fast jump navigation
- `ace-window`: quick window switching
- `diff-hl`: Git gutter markers
- `vundo`: visual undo tree
- `dired-subtree`: expandable Dired tree
- `helpful`: better help buffers

## Project / Git

- `projectile-mode` is enabled
- project search paths:
  - `~/dev/`
  - `~/projects/`
  - `~/`
- `magit` is installed and available
- `diff-hl` integrates with Magit refresh hooks

## External Tools Expected

This config is best with these tools available on `PATH`:

- `lua-language-server`
- `stylua`
- `gopls`
- `gofmt`
- `rust-analyzer`
- `rustfmt`
- `zls`
- `clangd`
- `clang-format`
- `typescript-language-server`
- `prettier`
- `pyright`
- `black`
- `shfmt`

The config also adds these paths into Emacs:

- `/opt/homebrew/bin`
- `~/.cargo/bin`
- `~/.local/bin`
- `~/go/bin`

## File Layout

`init.el` only loads modules. Real config lives in `lisp/`.

- [init.el](/Users/abx/.emacs.d/init.el)
- [lisp/package-config.el](/Users/abx/.emacs.d/lisp/package-config.el)
- [lisp/theme-config.el](/Users/abx/.emacs.d/lisp/theme-config.el)
- [lisp/modeline-config.el](/Users/abx/.emacs.d/lisp/modeline-config.el)
- [lisp/ui-config.el](/Users/abx/.emacs.d/lisp/ui-config.el)
- [lisp/options-config.el](/Users/abx/.emacs.d/lisp/options-config.el)
- [lisp/ivy-config.el](/Users/abx/.emacs.d/lisp/ivy-config.el)
- [lisp/projectile-config.el](/Users/abx/.emacs.d/lisp/projectile-config.el)
- [lisp/magit-config.el](/Users/abx/.emacs.d/lisp/magit-config.el)
- [lisp/qol-config.el](/Users/abx/.emacs.d/lisp/qol-config.el)
- [lisp/lsp-config.el](/Users/abx/.emacs.d/lisp/lsp-config.el)
- [lisp/company-config.el](/Users/abx/.emacs.d/lisp/company-config.el)
- [lisp/flycheck-config.el](/Users/abx/.emacs.d/lisp/flycheck-config.el)
- [lisp/format-config.el](/Users/abx/.emacs.d/lisp/format-config.el)

## Notes

- This setup currently keeps `ivy`/`counsel` as the minibuffer completion system.
- `lsp-ui` hover docs and Company popups are styled to stay visually light on the transparent Gruvbox frame.
- If a key in this README ever stops matching reality, check the module listed above first. This README is intended to track the live config.
