class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.13.29"
    
    sha_darwin_amd64 = "97d71d5226f6241eae9efcddcf54b8fb4260ba707c6abfd91e474c545a8e8707"
    sha_darwin_arm64 = "271a7b17dbdd69ada7089ea0f37f2ad6d7cbcebc9e00f4df4721bd61567aa767"
    sha_linux_amd64 = "3b2ee8035912d3abb9f4b39a81b334f51acc3056151e9a4b553b623e811c3de5"
    sha_linux_arm64 = "4cc770d130b94b2f9d19bcbb1f1d0aba53efbcaa12b8e7b0ba759adc59f1d78c"

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
  
