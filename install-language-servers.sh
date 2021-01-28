#!/bin/bash

for app in "bash-language-server" "vscode-html-languageserver-bin" "vscode-json-languageserver" "typescript-language-server" "vls" "yaml-language-server" 

do
    echo "Installing $app"
    sudo npm install -g $app
done

for app in "jedi-language-server"

do
    echo "Installing $app"
    pip install -U $app
done

for app in "lua-language-server-git" "gopls"

do
    echo "Installing $app"
    yay -S $app
done
