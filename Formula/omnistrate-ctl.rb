class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.13.25"
    
    sha_darwin_amd64 = "009b573a1ed76ed04926d01458a19ba0bcb439da0a90e4e1d861c16342dbaeb5"
    sha_darwin_arm64 = "c772184426e843e0d077f587e3499a4ba0593420d9200a9cf2900d63be0727ca"
    sha_linux_amd64 = "012790a9acab62f4081d145e8c9ae000c0aa654f8652270b595a5e50c5bb0668"
    sha_linux_arm64 = "e8eb79d19d3f1ab0fb9b141c9d6e5eeb2af4aa58fa60510169ce18292cd8c2f1"

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
  
