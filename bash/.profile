. ~/.profile-functions

color_my_prompt

export GOPATH=$(go env GOPATH)
export KELP="$GOPATH/src/github.com/stellar/kelp"
export PATH="/usr/local/bin:$GOPATH/bin:$KELP/bin:$PATH"
