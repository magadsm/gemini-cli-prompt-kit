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
chmod +x install.sh
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

## Доступные промпты и роли

### Промпты для разработчиков:

| Промпт | Описание | Использование |
|--------|----------|---------------|
| [python_developer.md](./prompts/python_developer.md) | Эксперт по разработке на Python | `gemini --prompt "$(cat prompts/python_developer.md)" "ваш запрос"` |
| [web_developer.md](./prompts/web_developer.md) | Специалист по веб-разработке | `gemini --prompt "$(cat prompts/web_developer.md)" "ваш запрос"` |
| [sql_expert.md](./prompts/sql_expert.md) | Эксперт по SQL и базам данных | `gemini --prompt "$(cat prompts/sql_expert.md)" "ваш запрос"` |
| [devops_engineer.md](./prompts/devops_engineer.md) | Специалист по DevOps | `gemini --prompt "$(cat prompts/devops_engineer.md)" "ваш запрос"` |
| [data_scientist.md](./prompts/data_scientist.md) | Специалист по анализу данных | `gemini --prompt "$(cat prompts/data_scientist.md)" "ваш запрос"` |

### Роли:

| Роль | Описание | Использование |
|------|----------|---------------|
| [code_reviewer.md](./roles/code_reviewer.md) | Опытный код-ревьювер | `gemini --prompt "$(cat roles/code_reviewer.md)" "ваш запрос"` |
| [architect.md](./roles/architect.md) | Архитектор программного обеспечения | `gemini --prompt "$(cat roles/architect.md)" "ваш запрос"` |
| [technical_writer.md](./roles/technical_writer.md) | Технический писатель | `gemini --prompt "$(cat roles/technical_writer.md)" "ваш запрос"` |
| [qa_engineer.md](./roles/qa_engineer.md) | QA инженер | `gemini --prompt "$(cat roles/qa_engineer.md)" "ваш запрос"` |

### Шаблоны для создания собственных промптов:

| Шаблон | Описание | Использование |
|--------|----------|---------------|
| [prompt_template.md](./templates/prompt_template.md) | Шаблон для создания новых промптов | Копировать и настроить под свои нужды |

## Создание собственных промптов

Вы можете создать собственные промпты, используя шаблон из директории `templates/`:

1. Скопируйте шаблон: `cp templates/prompt_template.md prompts/my_custom_prompt.md`
2. Отредактируйте файл, заполнив все разделы в соответствии с вашими потребностями
3. Используйте свой промпт: `gemini --prompt "$(cat prompts/my_custom_prompt.md)" "ваш запрос"`

## Участие в проекте

Приветствуются предложения по улучшению и новые промпты/роли! Чтобы внести свой вклад:

1. Форкните репозиторий
2. Создайте ветку для ваших изменений (`git checkout -b feature/amazing-prompt`)
3. Закоммитьте ваши изменения (`git commit -am 'Добавлен потрясающий промпт'`)
4. Отправьте изменения в ваш форк (`git push origin feature/amazing-prompt`)
5. Откройте Pull Request

## Лицензия

MIT