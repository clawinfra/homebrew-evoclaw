# EvoClaw - Self-evolving AI agent framework
class Evoclaw < Formula
  desc "Self-evolving AI agent framework for edge devices"
  homepage "https://github.com/clawinfra/evoclaw"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawinfra/evoclaw/releases/download/v#{version}/evoclaw-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_ARM64_SHA256"
    else
      url "https://github.com/clawinfra/evoclaw/releases/download/v#{version}/evoclaw-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_AMD64_SHA256"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "evoclaw-darwin-arm64" => "evoclaw"
    else
      bin.install "evoclaw-darwin-amd64" => "evoclaw"
    end
  end

  test do
    system "#{bin}/evoclaw", "--version"
  end
end
