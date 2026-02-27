# typed: false
# frozen_string_literal: true

class Evoclaw < Formula
  desc "Self-evolving AI agent framework"
  homepage "https://github.com/clawinfra/evoclaw"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.6.0/evoclaw-darwin-arm64.tar.gz"
      sha256 "6864266271f9971013eae5bb51b141bb1ee2231d46c586c0df74ce2de9188359"
    else
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.6.0/evoclaw-darwin-amd64.tar.gz"
      sha256 "864222dc59999a38ac2c7987f2df390cf0e79bc9d7d7768f110bae462cb06008"
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
