FROM golang
MAINTAINER Jayne Jacobs jaynejacobs@jaynejacobs.com

# Declare required environment variables
ENV GOPHERFACE_APP_ROOT=/go/src/github.com/JayneJacobs/gopherface
ENV GOPHERFACE_HASH_KEY="CRKVBJs0kfyeQ9Y1"
ENV GOPHERFACE_BLOCK_KEY="9LtmRLzVH27CwxrO"
ENV GOPATH=/go

# Get the required Go packages
RUN go get -u github.com/JayneJacobs/gopherjs
RUN go get -u honnef.co/go/js/dom
RUN go get -u -d -tags=js github.com/gopherjs/jsbuiltin
RUN go get -u honnef.co/go/js/xhr
RUN go get -u github.com/gopherjs/websocket
RUN go get -u go.isomorphicgo.org/go/isokit 
RUN go get -u github.com/tdewolff/minify
RUN go get -u github.com/JayneJacobs/gopherface
RUN go get -u go.isomorphicgo.org/uxtoolkit/cog
RUN go get  /go/src/github.com/tdewolff/parse


# Transpile and install the client-side application code
RUN cd $GOPHERFACE_APP_ROOT/client; go get ./..; /go/bin/gopherjs build -m --verbose -o $GOPHERFACE_APP_ROOT/static/js/client.min.js

# Build and install the server-side application code
RUN go install github.com/JayneJacobs/gopherface

# Specify the entrypoint
ENTRYPOINT /go/bin/gopherface

# Expose port 8080 of the container
EXPOSE 8080

