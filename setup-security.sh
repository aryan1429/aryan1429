#!/bin/bash

# 🔐 Security Setup Script
# This script helps you set up API keys securely

echo "🔐 GitHub Metrics - Security Setup"
echo "=================================="
echo ""

# Check if .env already exists
if [ -f "./metrics-master/.env" ]; then
    echo "⚠️  .env file already exists!"
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Setup cancelled."
        exit 0
    fi
fi

# Copy .env.example to .env
if [ -f "./metrics-master/.env.example" ]; then
    cp ./metrics-master/.env.example ./metrics-master/.env
    echo "✅ Created .env from template"
else
    echo "❌ .env.example not found! Please ensure you're in the correct directory."
    exit 1
fi

echo ""
echo "📝 Next steps:"
echo "1. Edit ./metrics-master/.env with your actual API keys"
echo "2. Get your API keys from:"
echo "   - Google API: https://console.cloud.google.com/apis/credentials"
echo "   - GitHub Token: https://github.com/settings/personal-access-tokens"
echo "3. Never commit the .env file to version control"
echo ""
echo "📖 For detailed instructions, see: ./SECURITY_SETUP.md"
echo ""

# Check if .env is in .gitignore
if grep -q "\.env" ./metrics-master/.gitignore; then
    echo "✅ .env is properly excluded from git"
else
    echo "⚠️  Warning: .env might not be properly excluded from git"
fi

echo ""
echo "🎉 Setup complete! Remember to:"
echo "   1. Add your actual API keys to ./metrics-master/.env"
echo "   2. Test your configuration"
echo "   3. Keep your API keys secure!"