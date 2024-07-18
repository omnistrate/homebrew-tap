class OmnistrateCtl < Formula
    desc "Omnistrate CTL command line tool"
    homepage "https://omnistrate.com"
    version "v0.9.8"
  
    if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-darwin-amd64"
        sha256 "93e38e8d56396fc700752bd489895a8b5f9be8dd018279cdec314eace69e8d48"
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-darwin-arm64"
        sha256 "77168ac59b7cbe7f618505e6a0a2727b2451b3cd47300619cd58ff201dd5f475"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-linux-amd64"
        sha256 "e9e97949d274bd9153c889fbce17e6a0b49803f9828b7ae4260ce2bc4536f22b"
      elsif Hardware::CPU.arm?
        url "https://github.com/omnistrate/cli/releases/download/#{version}/omnistrate-ctl-linux-arm64"
        sha256 "241f44721db2595664c2dad07adb9dde10d2d6982b491bbe31aa9aca0a4ebe45"
      end
    end
  
    def install
      bin.install "omnistrate-ctl"
    end
  
    test do
      system "#{bin}/omnistrate-ctl", "--version"
    end
  end
  