# EvoClaw Homebrew Tap

Official Homebrew tap for [EvoClaw](https://github.com/clawinfra/evoclaw) - Self-evolving AI agent framework.

## Installation

```bash
# Add the tap
brew tap clawinfra/evoclaw

# Install EvoClaw
brew install evoclaw

# Verify installation
evoclaw --version
```

## Usage

```bash
# Initialize a new agent
evoclaw init

# Start the orchestrator
evoclaw start

# Check status
evoclaw status

# View help
evoclaw --help
```

## Upgrading

```bash
# Update tap
brew update

# Upgrade EvoClaw
brew upgrade evoclaw
```

## Uninstall

```bash
brew uninstall evoclaw
brew untap clawinfra/evoclaw
```

## Supported Platforms

- macOS 12+ (Intel)
- macOS 12+ (Apple Silicon)

For Linux, Windows, and Raspberry Pi, see [installation guide](https://github.com/clawinfra/evoclaw/blob/main/docs/INSTALLATION.md).

## Maintainer Notes

### Updating the Formula

When releasing a new version:

1. Build and create GitHub release with binaries
2. Download both macOS binaries and calculate SHA256:
   ```bash
   wget https://github.com/clawinfra/evoclaw/releases/download/v1.0.0/evoclaw-darwin-amd64.tar.gz
   wget https://github.com/clawinfra/evoclaw/releases/download/v1.0.0/evoclaw-darwin-arm64.tar.gz
   shasum -a 256 evoclaw-darwin-*.tar.gz
   ```
3. Update `Formula/evoclaw.rb`:
   - Update `version`
   - Replace `PLACEHOLDER_AMD64_SHA256` with Intel binary SHA256
   - Replace `PLACEHOLDER_ARM64_SHA256` with Apple Silicon binary SHA256
4. Commit and push:
   ```bash
   git add Formula/evoclaw.rb
   git commit -m "chore: bump version to v1.0.0"
   git push origin main
   ```
5. Users will see the update on `brew update`

### Testing Locally

```bash
# Audit the formula
brew audit --new-formula evoclaw

# Test installation
brew install --build-from-source evoclaw

# Test upgrade
brew upgrade evoclaw

# Run tests
brew test evoclaw
```

## Support

- Issues: https://github.com/clawinfra/evoclaw/issues
- Docs: https://github.com/clawinfra/evoclaw/tree/main/docs
- Discord: https://discord.gg/evoclaw

## License

MIT
