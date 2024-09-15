FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json dan package-lock.json terlebih dahulu
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh file ke working directory
COPY . .

# Expose port 3000
EXPOSE 3000

# Command untuk menjalankan aplikasi
CMD ["node", "index.js"]
