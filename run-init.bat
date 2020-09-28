@echo off

echo versions
node -v
npm -v
npx -v
yarn -v
choco -v

REM install windows chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

npm install -g @aws-amplify/cli
npm install -g npx
choco install yarn

REM first step with amplify
REM give user programmatic access and AdministratorAccess policy
amplify configure

npx create-react-app amplifyreactapp

cd amplifyreactapp


npm build
yarn build
npm start

REM init a new backend
amplify init


npm install aws-amplify @aws-amplify/ui-react

