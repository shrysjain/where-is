class Whereis < Formula
  desc "A command-line tool to easily find files and directories"
  homepage "https://github.com/shrysjain/where-is"
  url "https://github.com/shrysjain/whereis/archive/v1.0.tar.gz"
  sha256 "YOUR_SHA256_HASH"
  license "MIT"

  def install
    bin.install "where-is.sh" => "where-is"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/whereis --help")
  end
end