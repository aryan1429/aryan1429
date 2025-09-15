# GitHub Profile README Customization Guide

## 🎯 How to Customize Your README

### 1. Replace Placeholder Information
- Replace `[Your Current Project]` with your actual current project
- Replace `[Technologies you're learning]` with what you're currently learning
- Replace `[Your Email]` with your actual email
- Replace `[Something interesting about you]` with a fun fact
- Update social media links with your actual profiles

### 2. Tech Stack Icons
The README uses [Skill Icons](https://skillicons.dev/) for technology badges. You can customize them by:
- Visit https://skillicons.dev/
- Choose your technologies
- Replace the icons in each section with your actual tech stack

Example: `https://skillicons.dev/icons?i=js,python,react,nodejs`

### 3. GitHub Stats Customization
- Replace `aryan1429` with your GitHub username in all GitHub stats URLs
- You can change themes by modifying the `theme` parameter:
  - Available themes: `dark`, `radical`, `merko`, `gruvbox`, `tokyonight`, `onedark`, `cobalt`, `synthwave`, `highcontrast`, `dracula`

### 4. Repository Pins
Update the pinned repositories section with your actual repositories:
```markdown
<a href="https://github.com/YOUR_USERNAME/YOUR_REPO">
  <img src="https://github-readme-stats.vercel.app/api/pin/?username=YOUR_USERNAME&repo=YOUR_REPO&theme=react&hide_border=true&bg_color=1F222E&title_color=F85D7F&icon_color=F8D866" alt="YOUR_REPO" />
</a>
```

## 🚀 Additional Features You Can Add

### 1. Coding Time Tracker (WakaTime)
Add this to show your coding activity:
```markdown
[![Aryan's wakatime stats](https://github-readme-stats.vercel.app/api/wakatime?username=YOUR_WAKATIME_USERNAME)](https://github.com/anuraghazra/github-readme-stats)
```

### 2. Spotify Now Playing
```markdown
[![Spotify](https://novatorem.vercel.app/api/spotify)](https://open.spotify.com/user/YOUR_SPOTIFY_USER_ID)
```

### 3. Medium Articles
```markdown
[![Aryan's Medium](https://github-readme-medium.vercel.app/?username=YOUR_MEDIUM_USERNAME)](https://medium.com/@YOUR_MEDIUM_USERNAME)
```

### 4. Snake Animation
Add this GitHub Action to show your contributions as a snake game:
```yaml
# Create .github/workflows/main.yml
name: Generate Datas
on:
  schedule:
    - cron: "* */12 * * *"
  workflow_dispatch:
jobs:
  build:
    name: Jobs to update datas
    runs-on: ubuntu-latest
    steps:
      - uses: Platane/snk@master
        id: snake-gif
        with:
          github_user_name: YOUR_USERNAME
          svg_out_path: dist/github-contribution-grid-snake.svg
      - uses: crazy-max/ghaction-github-pages@v2.1.3
        with:
          target_branch: output
          build_dir: dist
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

Then add this to your README:
```markdown
![Snake animation](https://github.com/YOUR_USERNAME/YOUR_USERNAME/blob/output/github-contribution-grid-snake.svg)
```

## 🎨 Color Schemes
You can customize colors by changing these parameters in the GitHub stats URLs:
- `bg_color`: Background color
- `title_color`: Title text color
- `icon_color`: Icon color
- `text_color`: Regular text color

## 📱 Mobile Responsive
The README is designed to be mobile-responsive. All images and layouts adapt to different screen sizes.

## ⚡ Performance Tips
- Use CDN links for images when possible
- Optimize image sizes
- Use WebP format for better compression
- Consider lazy loading for heavy content

## 🔧 Troubleshooting
If images don't load:
1. Check if your GitHub username is correct in URLs
2. Verify repository names are spelled correctly
3. Ensure repositories are public
4. Clear browser cache

## 📚 Resources
- [GitHub README Stats](https://github.com/anuraghazra/github-readme-stats)
- [Skill Icons](https://skillicons.dev/)
- [GitHub Profile Trophy](https://github.com/ryo-ma/github-profile-trophy)
- [Shields.io](https://shields.io/) for custom badges
- [Awesome GitHub Profile README](https://github.com/abhisheknaiidu/awesome-github-profile-readme)