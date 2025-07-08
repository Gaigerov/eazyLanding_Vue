#!/bin/bash

# Удаляем предыдущие сборки
rm -rf dist
rm -rf node_modules

# Устанавливаем зависимости
npm install

# Собираем проект
npm run build

# Переходим в папку сборки
cd dist

# Создаем файл .nojekyll (важно для GitHub Pages)
touch .nojekyll

# Инициализируем репозиторий
git init
git checkout -b gh-pages
git add -A
git commit -m "Deploy to GitHub Pages"

# Пушим в ветку gh-pages
git push -f git@github.com:gaigerov/eazyLanding_Vue.git gh-pages

# Возвращаемся обратно
cd ..