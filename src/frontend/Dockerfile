# Dockerfile for Next.js frontend
FROM node:22-alpine

WORKDIR /app

# Salin dependencies dan install
COPY package*.json ./
RUN npm install

# Salin seluruh source code
COPY . .

# Nonaktifkan turbopack sementara (optional)
ENV TURBOPACK=0

# Expose port 3000 (Next.js)
EXPOSE 3000

# Jalankan development server
CMD ["npm", "run", "dev"]
