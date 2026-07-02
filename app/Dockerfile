# Use Node.js 22 on Alpine Linux as the build environment
FROM node@sha256:16e22a550f3863206a3f701448c45f7912c6896a62de43add43bb9c86130c3e2 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy dependency files first to leverage Docker layer caching
COPY package.json yarn.lock ./

# Install dependencies exactly as specified in yarn.lock
RUN yarn install --frozen-lockfile

# Copy the rest of the application source code
COPY . .

# Build the React app for production, disabling ESLint to prevent warnings failing the build
RUN DISABLE_ESLINT_PLUGIN=true yarn build



# Start a fresh minimal image for the final runtime stage
FROM node@sha256:16e22a550f3863206a3f701448c45f7912c6896a62de43add43bb9c86130c3e2

# Upgrade all Alpine packages to their latest versions to patch known vulnerabilities
RUN apk upgrade --no-cache

# Create a non-root group and user to run the application securely
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Install serve globally to serve the static build files
RUN yarn global add serve

# Set the working directory for the runner stage
WORKDIR /app

# Copy only the compiled build output from the builder stage
COPY --from=builder /app/build ./build

# Transfer ownership of the app directory to the non-root user
RUN chown -R appuser:appgroup /app

# Document that the container listens on port 3000
EXPOSE 3000

# Switch to the non-root user for all subsequent commands
USER appuser

# Start the application using serve in single page app mode
ENTRYPOINT ["serve", "-s", "build"]