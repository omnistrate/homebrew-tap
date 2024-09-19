class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.9.86"
    
    sha_darwin_amd64 = "475789449214886b12f77dd50182a96566e4895ff8e1b39bd00534295b8bb52e"
    sha_darwin_arm64 = "fc07e064e5fad0997d0575e30be21e054db34d5a4fb54e446238bcad16966f60"
    sha_linux_amd64 = "b9408910b0b5e96452ec37129c470ecdc69e1b460ddc3c0d3af96320499bf943"
    sha_linux_arm64 = "0a107a80c8c702b938a9dad12c7cb65dd927ed08c7c7a14d432db8c4d938b80a"

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
  
