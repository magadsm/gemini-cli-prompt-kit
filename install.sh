#!/bin/bash

# Скрипт установки Gemini CLI Prompt Kit

# Проверка установки Gemini CLI
if ! command -v gemini &> /dev/null; then
    echo "Gemini CLI не обнаружен. Пожалуйста, установите Gemini CLI перед использованием этого набора промптов."
    echo "Подробности: https://github.com/google/gemini-cli"
    exit 1
fi

# Определение директории установки
DEFAULT_INSTALL_DIR="$HOME/.gemini/prompts"
INSTALL_DIR=${1:-$DEFAULT_INSTALL_DIR}

# Создание директории для промптов, если она не существует
mkdir -p "$INSTALL_DIR/prompts"
mkdir -p "$INSTALL_DIR/roles"
mkdir -p "$INSTALL_DIR/templates"

# Копирование файлов
echo "Копирование промптов и ролей в $INSTALL_DIR..."
cp -r prompts/* "$INSTALL_DIR/prompts/"
cp -r roles/* "$INSTALL_DIR/roles/"
cp -r templates/* "$INSTALL_DIR/templates/"

# Создание файлов алиасов для bash и zsh
BASH_ALIASES="$HOME/.bash_aliases"
BASH_RC="$HOME/.bashrc"
ZSH_RC="$HOME/.zshrc"

create_aliases() {
    echo "# Gemini CLI Prompt Kit Aliases" > "$1"
    echo "# Промпты" >> "$1"
    
    for file in prompts/*.md; do
        filename=$(basename "$file" .md)
        echo "alias gemini-$filename=\"gemini --prompt \\\"\$(cat $INSTALL_DIR/prompts/$filename.md)\\\"\"" >> "$1"
    done
    
    echo "# Роли" >> "$1"
    for file in roles/*.md; do
        filename=$(basename "$file" .md)
        echo "alias gemini-role-$filename=\"gemini --prompt \\\"\$(cat $INSTALL_DIR/roles/$filename.md)\\\"\"" >> "$1"
    done
}

# Спросить пользователя, хочет ли он добавить алиасы
read -p "Хотите ли вы создать алиасы для быстрого доступа к промптам? (y/n): " CREATE_ALIASES

if [ "$CREATE_ALIASES" = "y" ] || [ "$CREATE_ALIASES" = "Y" ]; then
    ALIASES_FILE="$HOME/.gemini_aliases"
    create_aliases "$ALIASES_FILE"
    
    # Проверка и добавление ссылки на файл алиасов в .bashrc или .zshrc
    if [ -f "$BASH_RC" ]; then
        if ! grep -q "source $ALIASES_FILE" "$BASH_RC"; then
            echo "# Gemini CLI Prompt Kit" >> "$BASH_RC"
            echo "if [ -f $ALIASES_FILE ]; then" >> "$BASH_RC"
            echo "    source $ALIASES_FILE" >> "$BASH_RC"
            echo "fi" >> "$BASH_RC"
        fi
        echo "Алиасы добавлены в $BASH_RC"
    fi
    
    if [ -f "$ZSH_RC" ]; then
        if ! grep -q "source $ALIASES_FILE" "$ZSH_RC"; then
            echo "# Gemini CLI Prompt Kit" >> "$ZSH_RC"
            echo "if [ -f $ALIASES_FILE ]; then" >> "$ZSH_RC"
            echo "    source $ALIASES_FILE" >> "$ZSH_RC"
            echo "fi" >> "$ZSH_RC"
        fi
        echo "Алиасы добавлены в $ZSH_RC"
    fi
    
    echo "Алиасы созданы в $ALIASES_FILE"
    echo "Чтобы активировать алиасы в текущем сеансе, выполните: source $ALIASES_FILE"
fi

echo "Установка Gemini CLI Prompt Kit завершена!"
echo "Теперь вы можете использовать промпты, например:"
echo "gemini --prompt \"\$(cat $INSTALL_DIR/prompts/python_developer.md)\" \"Ваш запрос\""

if [ "$CREATE_ALIASES" = "y" ] || [ "$CREATE_ALIASES" = "Y" ]; then
    echo "Или с помощью алиаса:"
    echo "gemini-python_developer \"Ваш запрос\""
fi