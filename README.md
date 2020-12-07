# ali.alik.setup
[ALI](https://docs.google.com/document/d/11oG00Nvn6vcFC2AemFmSkZNp0trEFrUHxL0IrkGR45c/ "the ALI project") Kernel box Setup for developers
## bash
Add git branch to bash prompt:
```
make
. ~/.profile
```
## [go](https://golang.org/doc/install "Download and install")
On my Raspberry Pi 4B, I installed `go version go1.15.6 linux/arm64`:
```
make install_go
. ~/.profile
go version
```
## vim
Use [vim-go v1.24](https://github.com/fatih/vim-go/tree/b919c60a6d1ca70a93d56fa4ee13dbcf412a8554):
```
make vim_go
```
Then open Vim and execute `:GoInstallBinaries`. When I did it, there was a complaint about `gcc` not found. As of yet, I am not sure if I need it on my box. Will update this step if I do.

It so happened that I needed `gcc` anyway. So I installed it as follows:
```
sudo apt-get install build-essential
sudo apt-get install g++-arm-linux-gnueabihf
```
