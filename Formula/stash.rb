class Stash < Formula
    desc "Local-first CLI for saving and organizing articles"
    homepage "https://github.com/ayushman-git/stash"
    version "0.1.0"
    license "MIT"
    bottle :unneeded
  
    on_macos do
      on_arm do
        url "https://github.com/ayushman-git/stash/releases/download/v0.1.1/stash-v0.1.1-aarch64-apple-darwin.tar.gz"
        sha256 "55fc1fbe04d612b35f9894a8d90fa6711f58fc68f89f44365a3e1ec8655bf556"
      end
      on_intel do
        url "https://github.com/ayushman-git/stash/releases/download/v0.1.1/stash-v0.1.1-x86_64-apple-darwin.tar.gz"
        sha256 "ea50b16614abc96a950806c0f6bc4e88dd57803fabf817f677865d28188f3497"
      end
    end
  
    def install
      bin.install "stash"
    end
  
    test do
      assert_match "stash", shell_output("#{bin}/stash --version")
    end
  end