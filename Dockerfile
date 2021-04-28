FROM golang AS builder
WORKDIR $GOPATH/src/app/
COPY ./app/ .
RUN go mod init
RUN go build -o /go/bin/rocks

FROM scratch
COPY --from=builder /go/bin/rocks /go/bin/rocks
ENTRYPOINT [ "/go/bin/rocks" ]
