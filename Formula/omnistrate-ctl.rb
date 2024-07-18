class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "74/merge"
    
    sha_darwin_amd64 = "32e14d805c074b1459c37dee353c1ed4f7beedd1f2b7ad1d7ef9e8b6d339f392"
    sha_darwin_arm64 = "ba5e25c4abe565a4e9223d33479f5a96133c82285930691e7f5cbf8290c6acf5"
    sha_linux_amd64 = "7db2e0185edc44492aa4e4d81bb80aaf17b12f482859c32cac3ea2c7b74733fc"
    sha_linux_arm64 = "d616875151a45cfc60118aaeca5ebb3f06c8a42954a33d9302d79dd131014b62"

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
  