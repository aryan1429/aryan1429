# 🔐 Security Guide - API Keys and Environment Variables

This guide helps you securely manage API keys and sensitive configuration for the GitHub Metrics project.

## 🚨 **IMPORTANT: Never commit API keys to version control!**

## 📋 Quick Setup

### 1. Create your environment file
```bash
# Copy the example file
cp .env.example .env

# Edit with your actual API keys
nano .env  # or use your preferred editor
```

### 2. Get your API keys

#### Google/YouTube API Key
1. Go to [Google Cloud Console](https://console.cloud.google.com/apis/credentials)
2. Create a new project or select existing
3. Enable YouTube Data API v3
4. Create credentials → API Key
5. Restrict the API key to YouTube Data API v3
6. Copy the key to your `.env` file:
   ```env
   GOOGLE_API_KEY=your_actual_api_key_here
   ```

#### GitHub Personal Access Token
1. Go to [GitHub Settings → Personal Access Tokens](https://github.com/settings/personal-access-tokens)
2. Generate new token (classic)
3. Select required scopes:
   - `repo` (for private repos)
   - `read:org` (for organization data)
   - `read:user` (for user data)
4. Copy to `.env`:
   ```env
   GITHUB_TOKEN=your_github_token_here
   ```

### 3. Verify your setup
```bash
# Check that .env is not tracked by git
git status
# .env should NOT appear in the list

# Test your configuration
npm test  # or your preferred test command
```

## 🛡️ Security Best Practices

### ✅ DO
- ✅ Use `.env` files for local development
- ✅ Use GitHub Secrets for CI/CD workflows
- ✅ Rotate API keys regularly (every 90 days recommended)
- ✅ Use minimal required permissions for tokens
- ✅ Keep different API keys for different environments
- ✅ Monitor API key usage in respective consoles

### ❌ DON'T
- ❌ Never commit `.env` files
- ❌ Don't share API keys in chat/email
- ❌ Don't use production keys in development
- ❌ Don't give broad permissions to tokens
- ❌ Don't ignore security alerts

## 🔄 What to do if API keys are exposed

If you accidentally commit API keys:

1. **Immediately rotate the exposed keys**
   - Google: [API Credentials Console](https://console.cloud.google.com/apis/credentials)
   - GitHub: [Personal Access Tokens](https://github.com/settings/personal-access-tokens)

2. **Remove from git history** (if recently committed):
   ```bash
   # For the last commit
   git reset --soft HEAD~1
   git reset HEAD .env
   git add . && git commit -m "Remove sensitive data"
   
   # For older commits, consider using git filter-branch or BFG Repo-Cleaner
   ```

3. **Force push** (⚠️ only if you're sure):
   ```bash
   git push --force-with-lease origin main
   ```

## 🏗️ CI/CD Setup (GitHub Actions)

### Setting up secrets in GitHub
1. Go to your repository settings
2. Navigate to "Secrets and variables" → "Actions"
3. Add repository secrets:
   - `GOOGLE_API_KEY`
   - `GITHUB_TOKEN`
   - Any other required API keys

### Example workflow usage:
```yaml
name: Generate Metrics
on:
  schedule:
    - cron: "0 0 * * *"
  workflow_dispatch:

jobs:
  metrics:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Generate metrics
        uses: lowlighter/metrics@latest
        with:
          token: \${{ secrets.GITHUB_TOKEN }}
          # Other configuration...
        env:
          GOOGLE_API_KEY: \${{ secrets.GOOGLE_API_KEY }}
```

## 🔍 Environment Variables Reference

| Variable | Required | Description | How to get |
|----------|----------|-------------|------------|
| `GOOGLE_API_KEY` | For music plugin | YouTube Data API access | [Google Cloud Console](https://console.cloud.google.com/apis/credentials) |
| `GITHUB_TOKEN` | For GitHub data | GitHub API access | [GitHub Settings](https://github.com/settings/personal-access-tokens) |
| `SPOTIFY_CLIENT_ID` | For Spotify | Spotify Web API | [Spotify Developer](https://developer.spotify.com/dashboard) |
| `SPOTIFY_CLIENT_SECRET` | For Spotify | Spotify Web API | [Spotify Developer](https://developer.spotify.com/dashboard) |
| `LASTFM_API_KEY` | For Last.fm | Last.fm API access | [Last.fm API](https://www.last.fm/api/account/create) |
| `WAKATIME_API_KEY` | For WakaTime | WakaTime API access | [WakaTime Settings](https://wakatime.com/api-key) |

## 🆘 Support

If you need help:
1. Check the [main README](../README.md) for general setup
2. Review the [security alerts](https://github.com/settings/security_analysis) in your repository
3. Open an issue if you encounter problems

---

**Remember: Security is everyone's responsibility. Keep your keys safe! 🔐**