class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.14.9"
    
    sha_darwin_amd64 = "70f2fcc911d455237f65d42a0bc838c13b56c1d941b7516d31df98839181afb0"
    sha_darwin_arm64 = "786a401980366b7e1d7ce4ce9fe350e227fa9ff1188dee4ddd6c638d1764efb6"
    sha_linux_amd64 = "c23fa8b46851693159aaf35b1df7b483ad8d877e9c0dfe8c1ba9c5b11626341e"
    sha_linux_arm64 = "0b3839a050265e971fb20b2e8ce4c4de68c16ccedcbe7fc05c1e1882f68f2817"

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
  
