class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v1.0.40"
    
    sha_darwin_amd64 = "681f6fc7e4e27041ff9859c7ecb70364e655578acb509b47003e5e03985e9f14"
    sha_darwin_arm64 = "d98327ece93e8e2cbe955f0e464aa24bd2be0343f726d9efce2319ec62a9f7d1"
    sha_linux_amd64 = "3e348b89db8de3db3a8c462e377facea563e22129b5c219bdb7afa9848989310"
    sha_linux_arm64 = "998a206197ce3c4bc8e823aa470941378ef41eb059448343b295ea06331d1733"

    if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate-oss/omnistrate-ctl/releases/download/#{version}/omnistrate-ctl-darwin-amd64.tar.gz"
        sha256 sha_darwin_amd64
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate-oss/omnistrate-ctl/releases/download/#{version}/omnistrate-ctl-darwin-arm64.tar.gz"
        sha256 sha_darwin_arm64
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate-oss/omnistrate-ctl/releases/download/#{version}/omnistrate-ctl-linux-amd64.tar.gz"
        sha256 sha_linux_amd64
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate-oss/omnistrate-ctl/releases/download/#{version}/omnistrate-ctl-linux-arm64.tar.gz"
        sha256 sha_linux_arm64
      end
    end
  
    def install
        # Homebrew automatically extracts .tar.gz files
        # The extracted binary will be available in the current directory
        
        # Determine the binary name based on platform
        binary_name = if OS.mac?
                        Hardware::CPU.intel? ? "omnistrate-ctl-darwin-amd64" : "omnistrate-ctl-darwin-arm64"
                      elsif OS.linux?
                        Hardware::CPU.intel? ? "omnistrate-ctl-linux-amd64" : "omnistrate-ctl-linux-arm64"
                      end
        
        # Install the binary
        bin.install binary_name => "omnistrate-ctl"
        bin.install_symlink "omnistrate-ctl" => "omctl"
    end
  
    test do
      assert_match "Omnistrate CTL #{version}", shell_output("#{bin}/omnistrate-ctl --version")
      assert_match "Omnistrate CTL #{version}", shell_output("#{bin}/omctl --version")
    end
  end
  
