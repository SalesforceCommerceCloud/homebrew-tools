class B2cCli < Formula
  desc "CLI tool for Salesforce Commerce Cloud B2C operations"
  homepage "https://github.com/SalesforceCommerceCloud/b2c-developer-tooling"
  url "https://registry.npmjs.org/@salesforce/b2c-cli/-/b2c-cli-2.16.2.tgz"
  sha256 "cca7617bff6b04b234be462d56743b6380951d608368ee071def9b2db7234ca2"
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
