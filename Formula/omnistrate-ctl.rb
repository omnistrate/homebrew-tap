class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.9.24"
    
    sha_darwin_amd64 = "d25cf00fe5643b7551ab8424553640241a5fa8094ae23c84df079a774c910315"
    sha_darwin_arm64 = "6c3491f45214bbe629ddc77c6ca1b93a578879c9a067dc66c1f14632908c204e"
    sha_linux_amd64 = "40ddb67ea59bd95a000de22c2ab43ccc8022ea512f346725ccd0f96f57927c80"
    sha_linux_arm64 = "b8ac3b9243c3a32c257f6be7f559779d8e639de34c1b55629ad9788a04571de9"

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
    end
  
    test do
      system "#{bin}/omnistrate-ctl", "--version"
    end
  end
  