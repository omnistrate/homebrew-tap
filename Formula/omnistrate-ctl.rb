class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.11.3"
    
    sha_darwin_amd64 = "9e73b41450001586df2aee8f5faae81e263a9e49d2c5a1270ea28e6477f5de70"
    sha_darwin_arm64 = "7a9a097f40276f56bce40b1eb2e8d65f4732dea7786f6081d182c10f1c718deb"
    sha_linux_amd64 = "c14448948c70ed7ad80aae351a8fd7ddd5c5f43331d5d17348203b52c7161520"
    sha_linux_arm64 = "c20b2659b208b218e7b5d0f16a4fd1116dea909f6937909d9cb95917ef27380d"

    if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-darwin-amd64"
        sha256 sha_darwin_amd64
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-darwin-arm64"
        sha256 sha_darwin_arm64
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-linux-amd64"
        sha256 sha_linux_amd64
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-linux-arm64"
        sha256 sha_linux_arm64
      end
    end
  
    def install
        if OS.mac?
            if Hardware::CPU.intel?
                bin.install "omnistrate-ctl-darwin-amd64" => "omnistrate-ctl"
            elsif Hardware::CPU.arm?
                bin.install "omnistrate-ctl-darwin-arm64" => "omnistrate-ctl"
            end
        elsif OS.linux?
            if Hardware::CPU.intel?
                bin.install "omnistrate-ctl-linux-amd64" => "omnistrate-ctl"
            elsif Hardware::CPU.arm?
                bin.install "omnistrate-ctl-linux-arm64" => "omnistrate-ctl"
            end
        end
        bin.install_symlink "omnistrate-ctl" => "omctl"
    end
  
    test do
      assert_match "Omnistrate CTL #{version}", shell_output("#{bin}/omnistrate-ctl --version")
      assert_match "Omnistrate CTL #{version}", shell_output("#{bin}/omctl --version")
    end
  end
  
