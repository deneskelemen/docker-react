#Base image
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


#sudo chown $USER ~/Library/Caches/com.microsoft.VSCode.ShipIt/*
#xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app
