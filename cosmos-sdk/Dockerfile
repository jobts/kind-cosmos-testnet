FROM golang:1.22-alpine3.20 as builder

# build simd
COPY testnet-exit-by-enter.patch /tmp
RUN apk add --no-cache build-base linux-headers git && \
    git clone --single-branch https://github.com/cosmos/cosmos-sdk && \
    cd cosmos-sdk && \
    patch -p1 < /tmp/testnet-exit-by-enter.patch && \
    make build

FROM alpine:3.20
COPY --from=builder /go/cosmos-sdk/build/simd /usr/bin/
RUN apk add --no-cache tini
WORKDIR /root/.simapp
