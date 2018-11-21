FROM docker.io/library/golang:1.11.2 AS builder
RUN  export CGO_ENABLED=0 GOOS=linux \
 &&  go get github.com/mxschmitt/fritzbox_exporter/cmd/exporter

FROM scratch
COPY --from=builder /go/bin/exporter /bin/fritzbox_exporter
ENTRYPOINT ["fritzbox_exporter"]
CMD ["-gateway-address","192.168.178.1"]
