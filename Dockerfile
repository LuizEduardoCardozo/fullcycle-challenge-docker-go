FROM golang:1.16.6-alpine3.14 AS builder

WORKDIR /usr/local/share/app

COPY hello.go go.mod ./

RUN go build -ldflags="-s -w" -o hello 


FROM scratch AS runner

COPY --from=builder /usr/local/share/app/hello /usr/local/bin/ 

ENTRYPOINT [ "hello" ]
