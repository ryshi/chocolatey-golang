# chocolatey-golang
golang package for local chocolatey server

## usage

### pack

* you should have chocolatey ( v0.9.9.8+) installed
* assume you have `server.pkg` in your host or dns
  * edit tools/chocolateyInstall.ps1 for some url else
* run `cpack`
* run `cpush golang.<version>.nupkg -s <your local server> -k <your apikey>`
* upload `go<version>.windows-amd64.zip`,`go<version>.windows-386.zip` to `http://server.pkg/pkgs/golang/`


### install

* run `cinst golang -s <your local server>`

