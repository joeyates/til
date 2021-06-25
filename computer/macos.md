# List keybindings

bind -p

# Operating System Version

sw_vers -productVersion

# Executable info

lipo -archs {{PATH}}
lipo -detailed_info {{PATH}}

# Run a program using a specific architecture

arch -arch arm64 ...
arch -arm64 ...

# M1 compilation

# openssl + ffi problems

arch -arch arm64 gem install ffi -v '1.15.0' --source 'https://rubygems.org/'

This works:

export optflags="-Wno-error=implicit-function-declaration";
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib -L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include -I$(brew --prefix openssl)/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$(brew --prefix openssl)/lib/pkgconfig"
rbenv install 2.5.5

Alternative:
RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC rbenv install 2.6.6

export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH

# capybara webkit

https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#homebrew

Install full XCode from app store
brew update
cd $(brew --prefix)/Library/Taps/homebrew/homebrew-core
git checkout 9ba3d6ef8891e5c15dbdc9333f857b13711d4e97 Formula/qt@5.5.rb
vim $(brew --prefix)/Library/Taps/homebrew/homebrew-core/Formula/qt@5.5.rb
# comment out line 25 "depends_on :macos => :mountain_lion"
arch -arm64 brew install qt@5.5
brew link qt5 --force
