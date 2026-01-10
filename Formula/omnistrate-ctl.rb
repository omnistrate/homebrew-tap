class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v1.0.68"
    
    sha_darwin_amd64 = "901cdc7c2c2fa0f6639e9a538e3a264552e0f15b73d9e987887dc2afc59bc086"
    sha_darwin_arm64 = "cba3d7402b3a9070481bd505cd248884287c106427cd3a3fece198702ba0feaf"
    sha_linux_amd64 = "3088972b991a80c065712fe769be657ef55f966286709c7f83f675cd90144da8"
    sha_linux_arm64 = "3dbe663901e9539dc8790808549697142d35cda852ac65db84c0a5b128a2d7b9"

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
  
