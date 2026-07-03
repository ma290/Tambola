FROM node:20-alpine

WORKDIR /app

# Install deps first for better layer caching
COPY package.json ./
RUN npm install --omit=dev --no-audit --no-fund

# Copy everything else (server.js, admin.html, display.html, offline.html, style.css, sw.js)
COPY . .

ENV NODE_ENV=production
ENV PORT=8080
# Change this in production! e.g. -e ADMIN_PIN=your-secret-pin
ENV ADMIN_PIN=9845

EXPOSE 8080

CMD ["node", "server.js"]
