class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v1.11.23"
    
    sha_darwin_amd64 = "a6510417edac444da7ccc974af8b0649d682e15f33901ab06ee668dfe3fe8c78"
    sha_darwin_arm64 = "d435bb2c6a7ddb115f88caa7fd4a4bf265fbdcab2463ddfc80838e8b52feee4b"
    sha_linux_amd64 = "c0e2b5d01334eaaac0a1ba487f6213ebeaab6fc496230a1aeacaceb78550adf0"
    sha_linux_arm64 = "a1645655bb3ec8701a5cdcea04ee52c2e320552d1eaf22daeb3d07aea4c69063"

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
  
