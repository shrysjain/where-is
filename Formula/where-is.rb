class Whereis < Formula
  desc "A command-line tool to easily find files and directories"
  homepage "https://github.com/shrysjain/where-is"
  url "https://github.com/shrysjain/where-is/archive/v1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  def install
    bin.install "where-is.sh" => "where-is"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/whereis --help")
  end
end
