# Gemini CLI Prompt Kit

Набор предопределенных промптов и ролей для работы с [Gemini CLI](https://github.com/google/gemini-cli) - инструментом командной строки для работы с моделями Gemini.

## Описание

Gemini CLI Prompt Kit (GCPK) — это коллекция готовых промптов и ролей, созданных для оптимизации работы с Gemini CLI. Этот набор вдохновлен Claude Command Development Kit (CCDK) и предоставляет аналогичную функциональность для пользователей Gemini.

## Особенности

- Коллекция предопределенных промптов для различных задач разработки
- Специализированные роли для повышения эффективности работы с кодом
- Простая интеграция с Gemini CLI
- Настраиваемые шаблоны для адаптации под ваши потребности

## Установка

```bash
# Клонирование репозитория
git clone https://github.com/magadsm/gemini-cli-prompt-kit.git
cd gemini-cli-prompt-kit

# Установка (опционально)
./install.sh
```

## Использование

### Быстрый старт

```bash
# Использование промпта для разработки на Python
gemini --prompt "$(cat prompts/python_developer.md)" "Создай функцию для подсчета частотности слов в тексте"

# Использование роли для код-ревью
gemini --prompt "$(cat roles/code_reviewer.md)" "Проверь следующий код: ..."
```

### Интеграция с вашими скриптами

Вы можете создать алиасы для быстрого доступа к часто используемым промптам:

```bash
# Добавьте в ваш .bashrc или .zshrc
alias gemini-py="gemini --prompt \"$(cat path/to/prompts/python_developer.md)\""
alias gemini-review="gemini --prompt \"$(cat path/to/roles/code_reviewer.md)\""
```

## Структура проекта

```
gemini-cli-prompt-kit/
├── prompts/                # Готовые промпты для разных задач
│   ├── python_developer.md # Промпт для разработки на Python
│   ├── web_developer.md    # Промпт для веб-разработки
│   └── ...
├── roles/                  # Специализированные роли
│   ├── code_reviewer.md    # Роль для код-ревью
│   ├── architect.md        # Роль для архитектурного проектирования
│   └── ...
├── templates/              # Шаблоны для создания собственных промптов
└── utils/                  # Вспомогательные скрипты
```

## Лицензия

MIT