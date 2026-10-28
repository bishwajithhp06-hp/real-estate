@echo off
echo ========================================================
echo   Hyperlocal Estate AI - Git Upload Helper
echo ========================================================
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in PATH!
    echo Please download and install Git from: https://git-scm.com/download/win
    echo After installing, reopen this script.
    echo.
    pause
    exit /b
)

echo [1/5] Initializing local Git repository...
git init

echo.
echo [2/5] Staging files (.env is protected by .gitignore)...
git add .

echo.
echo [3/5] Creating initial commit...
git commit -m "Initial commit: Hyperlocal Estate AI platform with Gemini Copilot"

echo.
echo [4/5] Setting default branch to main...
git branch -M main

echo.
echo ========================================================
echo Almost done! Enter your GitHub repository URL.
echo Example: https://github.com/your-username/hyperlocal-estate-ai.git
echo (Create one at https://github.com/new if you haven't yet)
echo ========================================================
set /p REPO_URL="Enter your GitHub Repository URL: "

if "%REPO_URL%"=="" (
    echo No URL entered. Aborting push. You can push manually anytime.
    pause
    exit /b
)

echo.
echo [5/5] Connecting to remote and pushing code...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git push -u origin main

echo.
echo ========================================================
echo All done! Your project is now uploaded to GitHub!
echo ========================================================
pause
