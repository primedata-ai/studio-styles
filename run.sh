#!/bin/env bash
set -o xtrace
set -x
command
{ set +x; } 2>/dev/null

GREEN='\033[0;32m'
NC='\033[0m'


printf "${GREEN}=> Your posthog repo: $1 \n${NC}"

printf "${GREEN}=> Add prime style\n${NC}"
cp -v assets/prime.style.scss $1/frontend/src/styles/prime.style.scss
echo 'import "./prime.style.scss" /* Contains PrimeData VN`s main styling configurations */' >> $1/frontend/src/styles/index.tsx

printf "${GREEN}=> Overwrite Logo:\n${NC}"
cp -v logo/Logo.tsx $1/frontend/src/toolbar/assets/Logo.tsx
cp -v logo/Logomark.tsx $1/frontend/src/toolbar/assets/Logomark.tsx

printf "${GREEN}=> Source change:\n${NC}"
cd $1
git status

