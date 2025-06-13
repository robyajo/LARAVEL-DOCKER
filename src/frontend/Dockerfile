# Gunakan Node versi LTS
FROM node:18-alpine

# Direktori kerja di container
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua file proyek
COPY . .

# Tambahkan environment agar tidak pakai Turbopack
ENV TURBOPACK=0

# Buka port 3000 untuk Next.js
EXPOSE 3000

# Jalankan development server
CMD ["npm", "run", "dev"]
