
# Install
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz

# Esit $HOME/.profile or /etc/profile

# set PATH so it includes go bin if it exists
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi

# set PATH so it includes go application if it exists
if [ -d "$(go env GOPATH)/bin" ] ; then
        PATH="$(go env GOPATH)/bin:$PATH"
fi

source $HOME/.profile


# Check go version
go version