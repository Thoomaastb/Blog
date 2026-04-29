FROM hugomods/hugo:exts AS builder
WORKDIR /site
COPY . .
RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /site/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf