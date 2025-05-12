class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.11.8"
    
    sha_darwin_amd64 = "d662d230f2ca6f5f5f79e626f5b83aa768ace8caa2c63e62c59d24e14917bbac"
    sha_darwin_arm64 = "69702c83670f62aed45a03829134bc093f5003020c34b7967191ca5a78cf48d1"
    sha_linux_amd64 = "1caaa9d4ed4e6f634d955a1abd77194ef3f6bf81639045a14552da8ea9e93d63"
    sha_linux_arm64 = "60cd722cff52ac3776e7ef4775ab3284ab45195abae84fc59163460fc0097808"

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
  
