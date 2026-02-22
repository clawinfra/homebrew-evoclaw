# typed: false
# frozen_string_literal: true

class Evoclaw < Formula
  desc "Self-evolving AI agent framework"
  homepage "https://github.com/clawinfra/evoclaw"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.4.0/evoclaw-darwin-arm64.tar.gz"
      sha256 "e0290d1faf35d632aec47a7db837a2fa680822fa43977f5dd0350e3e93dc7d20"
    else
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.4.0/evoclaw-darwin-amd64.tar.gz"
      sha256 "2fa9e6745f90eca440e6a9e0c2692e2f9d6ca4a4348158b5fbc8e0659c5fd1da"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "evoclaw-darwin-#{arch}" => "evoclaw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/evoclaw version")
  end
end
