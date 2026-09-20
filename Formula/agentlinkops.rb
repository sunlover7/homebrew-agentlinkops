# AgentLinkOps CLI: a backlink ledger in your repository, local link checks with dated
# evidence, and the agent skill pack. Installs the published npm tarball, so `brew install`
# and `npm install -g agentlinkops` ship the same bytes.
require "language/node"

class Agentlinkops < Formula
  desc "Backlink ledger and agent skill pack for AgentLinkOps (MCP, CLI, HTTP)"
  homepage "https://agentlinkops.com/"
  url "https://registry.npmjs.org/agentlinkops/-/agentlinkops-0.6.2.tgz"
  sha256 "896552dba7b969cd02a512ee5552e93abccc9c48860f8058af7bb2669b4d1450"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "agentlinkops", shell_output("#{bin}/agentlinkops --help")
    assert_match "AgentLinkOps agent reference", shell_output("#{bin}/agentlinkops skill")
  end
end
