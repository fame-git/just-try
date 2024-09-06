# Use golang docker image from docker hub
# current version is golang:1.23.1
# with tags alpine image for slim build
# ref: https://hub.docker.com/_/golang
FROM golang:1.23.1-alpine3.20

# Set output dir
WORKDIR /app

# Copy go mod to app dir
COPY go.mod ./

# Download go modules (even we used stdlib lol, just in case for my practices)
RUN go mod download

# Copy go source code to app dir
COPY *.go ./

# Complie go application
RUN CGO_ENABLED=0 GOOS=linux go build -o /hello-go

# Start command when trigger the image
CMD ["/hello-go"]