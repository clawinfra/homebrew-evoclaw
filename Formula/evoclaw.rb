# typed: false
# frozen_string_literal: true

class Evoclaw < Formula
  desc "Self-evolving AI agent framework"
  homepage "https://github.com/clawinfra/evoclaw"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.5.0/evoclaw-darwin-arm64.tar.gz"
      sha256 "8d81fbe4d77f3af9accae88d96f6f26f79444d16005648230b7f3ea0865a8d10"
    else
      url "https://github.com/clawinfra/evoclaw/releases/download/v0.5.0/evoclaw-darwin-amd64.tar.gz"
      sha256 "2cd45f47642928ecbc4e54d1d6ffb60c44e0629f26b17d8ac08505457b16e372"
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
