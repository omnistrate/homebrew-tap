class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "1.0.0"
  
    if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate/cli/releases/#{version}/download/omnistrate-ctl-darwin-amd64"
        sha256 "your_mac_intel_sha256"
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate/cli/releases/#{version}/download/omnistrate-ctl-darwin-arm64"
        sha256 "your_mac_arm_sha256"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate/cli/releases/#{version}/download/omnistrate-ctl-linux-amd64"
        sha256 "your_linux_intel_sha256"
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate/cli/releases/#{version}/download/omnistrate-ctl-linux-arm64"
        sha256 "your_linux_arm_sha256"
      end
    end
  
    def install
      bin.install "omnistrate-ctl"
    end
  
    test do
      system "#{bin}/omnistrate-ctl", "--version"
    end
  end
  