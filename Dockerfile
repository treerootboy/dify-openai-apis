FROM rust:1.72 as builder
WORKDIR /app
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim
COPY --from=builder /usr/local/cargo/bin/dify-openai-apis /usr/local/bin/dify-openai-apis
CMD ["dify-openai-apis"]
