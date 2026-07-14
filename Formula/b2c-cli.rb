class B2cCli < Formula
  desc "CLI tool for Salesforce Commerce Cloud B2C operations"
  homepage "https://github.com/SalesforceCommerceCloud/b2c-developer-tooling"
  url "https://registry.npmjs.org/@salesforce/b2c-cli/-/b2c-cli-1.20.0.tgz"
  sha256 "d06ca151fec3ed94e9a11d469ed984508ee612ba7f9d765490ac9703547dbbe4"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/@salesforce/b2c-cli"
    regex(/"version":\s*"([^"]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args

    # Create wrapper script that sets OCLIF client home for proper auto-update support
    # This prevents oclif from trying to update to a non-brew location
    (bin/"b2c").write_env_script libexec/"bin/b2c",
      B2C_OCLIF_CLIENT_HOME: lib/"client"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/b2c --version")
  end
end
