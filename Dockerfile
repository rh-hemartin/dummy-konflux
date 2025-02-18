FROM registry.access.redhat.com/ubi9/go-toolset:9.5-1739801907 as builder

COPY go.mod ./
COPY *.go ./
RUN GOOS=linux go build -o ./app

FROM registry.access.redhat.com/ubi9/go-toolset:9.5-1739801907 as runner

COPY --from=builder /opt/app-root/src/app app
EXPOSE 8080
USER nonroot:nonroot
ENTRYPOINT ["./app"]
