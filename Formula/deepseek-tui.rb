class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/coohu/DeepSeek-TUI"
  version "0.8.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-macos-arm64", using: :nounzip
      sha256 "d4518f62d1497bd3aa449f3935e2833ecd75c711ad5362935a62f5d76a12bfd2"
      resource "tui" do
        url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "89562229915c6e796451efe63a20ae6e426a04e857df577e1ed59fedcfc9f7d0"
      end
    else
      url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-macos-x64", using: :nounzip
      sha256 "bc7e8ce5097ecdb970e731047bdbb7eee4448933439bc78edbe323ea3993a214"
      resource "tui" do
        url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-macos-x64", using: :nounzip
        sha256 "dbd8600c8016e5aba927f821c0cbe7b63a7a4430e0de629b7c29ba6200d2b85a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-linux-arm64", using: :nounzip
      sha256 "5eadbdc1daf6e0c664996c7fc1afd75a1235891c9aa6afe577ca0ee928b4ffb7"
      resource "tui" do
        url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "472e2f00fd025e534b0ecbfe8f9804683bd3a1c8dfc4b7652fba42b70ab1a043"
      end
    else
      url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-linux-x64", using: :nounzip
      sha256 "1bdf14323f9b32f78c815d9d3b2dd473d57acb90e0298a521f22bee7d200ac30"
      resource "tui" do
        url "https://github.com/coohu/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-linux-x64", using: :nounzip
        sha256 "cd122a69aa1ed33b6a7d9832da25b9411e3b25a27d8117d9e0202113628ac2e8"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "deepseek"
    resource("tui").stage { bin.install Dir["*"].first => "deepseek-tui" }
  end

  test do
    system "#{bin}/deepseek", "--version"
  end
end
