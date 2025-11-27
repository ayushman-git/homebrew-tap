# Formula: ayushman-git/homebrew-tap/stash.rb
class Stash < Formula
  desc "Local-first CLI for saving and organizing articles"
  homepage "https://github.com/ayushman-git/stash"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ayushman-git/stash/releases/download/v0.1.1/stash-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "55fc1fbe04d612b35f9894a8d90fa6711f58fc68f89f44365a3e1ec8655bf556"
    else
      url "https://github.com/ayushman-git/stash/releases/download/v0.1.1/stash-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "ea50b16614abc96a950806c0f6bc4e88dd57803fabf817f677865d28188f3497"
    end
  end

  def install
    # If tarball contains the binary at root:
    if File.exist?("stash")
      bin.install "stash"
    else
      # If tarball expands into a directory:
      dir = Dir.glob("stash-*").find { |d| File.directory?(d) } || "."
      cd dir do
        bin.install "stash"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stash --version")
  end
end
