# homebrew-tap

Homebrew tap for [forfudan](https://github.com/forfudan) CLI tools.

Currently published:

- [`decimo`](https://github.com/forfudan/decimo) — arbitrary-precision calculator built with Mojo

## Install

```bash
brew install forfudan/tap/decimo
```

Or, if you prefer to tap once and then use the bare formula name:

```bash
brew tap forfudan/tap
brew install decimo
```

## Verify

```bash
decimo --version
```

## Upgrade

```bash
brew update
brew upgrade decimo
```

## Uninstall

```bash
brew uninstall decimo
brew untap forfudan/tap
```

## Supported platforms

- macOS arm64 (Apple Silicon)
- Linux x86_64

Each formula installs a self-contained binary plus the bundled Mojo
runtime libraries; no Mojo or Pixi installation is required on the
user's machine.

## License

Apache-2.0 (matches the upstream tools).
