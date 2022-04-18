FROM golang:1.18 as build

WORKDIR /usr/src/app

COPY ./hello-world.go .

RUN go build hello-world.go

FROM scratch

WORKDIR /app

COPY --from=build /usr/src/app/hello-world /app

ENTRYPOINT [ "./hello-world" ]