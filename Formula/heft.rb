class Heft < Formula
  desc "Scan Helm charts and report container images"
  homepage "https://github.com/tonur/heft"
  url "https://github.com/tonur/heft/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "e4dfa56e295896feeadc7d78b801df066c270d5de9d39a8c5459ab00d3c709f3"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/heft"
  end

  test do
    output = shell_output("#{bin}/heft --version")
    assert_match(/\S+/, output)
  end
end
