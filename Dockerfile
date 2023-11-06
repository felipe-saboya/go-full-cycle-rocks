FROM scratch AS base
WORKDIR /app

FROM golang:1.21 AS build
WORKDIR /usr/src/app
COPY . .
RUN go build go-full-cycle-rocks

FROM base AS final
WORKDIR /app
COPY --from=build /usr/src/app .
CMD ["./go-full-cycle-rocks"]
