# Git Repository Clone Instructions

This document explains how to clone git repositories with authentication.

## Basic Clone

For public repositories:
```bash
git clone https://github.com/user/repository.git
```

## Clone with Authentication

For private repositories, you may need to use authentication tokens:

```bash
git clone https://x-access-token:YOUR_TOKEN@builder.example.com/apps/app-id.git
```

## Using the Clone Script

This repository includes a helper script `clone_repository.sh` that can be used to clone repositories:

```bash
chmod +x clone_repository.sh
./clone_repository.sh <git-url> [destination-directory]
```

### Examples:

1. Clone to default directory:
```bash
./clone_repository.sh https://github.com/user/repo.git
```

2. Clone to specific directory:
```bash
./clone_repository.sh https://x-access-token:TOKEN@builder.example.com/apps/app-id.git my-app
```

## Security Best Practices

⚠️ **IMPORTANT**: Never hardcode authentication tokens in your scripts or commit them to version control.

### Recommended Approaches:

1. **Environment Variables**:
```bash
export GIT_TOKEN="your-token-here"
git clone https://x-access-token:${GIT_TOKEN}@builder.example.com/apps/app-id.git
```

2. **Git Credential Manager**:
```bash
# Use cache (credentials stored in memory temporarily - more secure)
git config --global credential.helper cache

# OR use OS-specific credential managers (most secure):
# macOS: osxkeychain
# Windows: wincred or manager
# Linux: libsecret or gnome-keyring
```

⚠️ **Warning**: Avoid using `credential.helper store` as it saves credentials in plaintext on disk.

3. **SSH Keys** (recommended for frequent access):
```bash
git clone git@github.com:user/repository.git
```

## Example Use Case

To clone the repository from the example URL provided, you would:

1. Extract your token from your authentication system
2. Use it with the clone command:
```bash
git clone https://x-access-token:YOUR_TOKEN@builder.kiloapps.io/apps/APP_ID.git
```

3. Or use the provided script:
```bash
./clone_repository.sh https://x-access-token:YOUR_TOKEN@builder.kiloapps.io/apps/APP_ID.git
```

**Note**: Replace `YOUR_TOKEN` and `APP_ID` with actual values from your authentication provider.
