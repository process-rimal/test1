# Repository Cloning Instructions

This repository provides a secure way to clone an external repository using access tokens.

## Security Notice

**IMPORTANT**: Never hardcode access tokens or credentials in your code or scripts. Always use environment variables or secure credential management systems.

## Prerequisites

- Git installed on your system
- Valid access token for the repository

## Usage

### Method 1: Using the clone script

1. Set your access token as an environment variable:
   ```bash
   export ACCESS_TOKEN=your_token_here
   ```

2. Run the clone script:
   ```bash
   ./clone-repository.sh
   ```

3. The repository will be cloned to the `cloned-repo` directory (or customize with `CLONE_DIR` environment variable).

**Advanced usage:**

- Clone a different repository by passing the URL as an argument:
  ```bash
  ./clone-repository.sh example.com/path/to/repo.git
  ```

- Or set the REPO_URL environment variable:
  ```bash
  export REPO_URL=example.com/path/to/repo.git
  ./clone-repository.sh
  ```

- Customize the clone directory:
  ```bash
  export CLONE_DIR=my-custom-directory
  ./clone-repository.sh
  ```

### Method 2: Manual clone

1. Set your access token as an environment variable:
   ```bash
   export ACCESS_TOKEN=your_token_here
   ```

2. Clone the repository manually:
   ```bash
   git clone https://x-access-token:${ACCESS_TOKEN}@builder.kiloapps.io/apps/bf0c83fb-786b-4568-a690-208accd8ceaf.git
   ```

## Security Best Practices

1. **Never commit tokens**: Always use environment variables or credential managers
2. **Use read-only tokens**: When possible, use tokens with minimal required permissions
3. **Rotate tokens regularly**: Change access tokens periodically
4. **Secure storage**: Store tokens in secure credential management systems
5. **Add to .gitignore**: Ensure any files containing credentials are in .gitignore

## Troubleshooting

- If you get authentication errors, verify your token is valid and not expired
- Ensure the token has the necessary permissions for the repository
- Check network connectivity and firewall settings
