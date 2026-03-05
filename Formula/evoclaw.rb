# typed: false
# frozen_string_literal: true

class Evoclaw < Formula
  desc "Self-evolving AI agent framework"
  homepage "https://github.com/clawinfra/evoclaw"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.6.1/evoclaw-darwin-arm64.tar.gz"
      sha256 "2c95eb99a9820364bd2b3d154a9fdcbc6b7a56a4e6ad7fd28f584f79f47a471b"
    else
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.6.1/evoclaw-darwin-amd64.tar.gz"
      sha256 "044a89584e60db3ba5269eb6e3c497f4b23daa58a3b30e365edff9cd5e1c3f29"
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
