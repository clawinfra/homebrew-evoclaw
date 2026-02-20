# typed: false
# frozen_string_literal: true

class Evoclaw < Formula
  desc "Self-evolving AI agent framework"
  homepage "https://github.com/clawinfra/evoclaw"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.3.2/evoclaw-darwin-arm64.tar.gz"
      sha256 "e302a2472d119eaba2f183319d894454a63e22607dba242f274cbad6f80283c5"
    else
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.3.2/evoclaw-darwin-amd64.tar.gz"
      sha256 "a9c3c65982744a43b31fc12123ac87d5942fcf0a2b1c8f2868f01416e274d073"
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
