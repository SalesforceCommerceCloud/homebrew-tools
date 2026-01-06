class B2cCli < Formula
  desc "CLI tool for Salesforce Commerce Cloud B2C operations"
  homepage "https://github.com/SalesforceCommerceCloud/b2c-developer-tooling"
  url "https://github.com/SalesforceCommerceCloud/b2c-developer-tooling/releases/download/v0.0.1-preview.7/salesforce-b2c-cli-0.0.1-preview.7.tgz"
  version "0.0.1-preview.7"
  sha256 "f3c0f04c7581bbed7c5222f287bf7f40d1639c0771ae79438cd7bdaa5ef33d45"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-[\w.]+)?)$/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/b2c --version")
  end
end
