### Hexlet tests and linter status:
[![Actions Status](https://github.com/dcdim/devops-for-programmers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/dcdim/devops-for-programmers-project-76/actions)

# Ansible Project for Server Setup

Этот проект Ansible автоматизирует развёртывание Redmine с внешней PostgreSQL базой данных и мониторингом через Datadog.

## Предварительные требования

- Ansible 2.9+
- SSH доступ к целевым серверам
- Привилегии sudo на целевых серверах
- Внешняя PostgreSQL база данных

## Подготовка проекта

1. Клонируйте репозиторий:
```bash
git clone <repository-url>
cd <project-directory>
```

2. Установка зависимостей:
```bash
make setup
```

3. Настройка Vault переменных

Все чувствительные данные (пароли, API-ключи) должны храниться в group_vars/webservers/vault.yml и быть зашифрованы через Ansible Vault:
```bash
vault_postgres_password: "your_secure_password"
vault_postgres_user: "your_username"
vault_postgres_db: "your_database"
vault_db_host: "your-db-host"
vault_db_port: "6432"

vault_datadog_api_key: "your_datadog_api_key"
vault_datadog_site: "datadoghq.eu"
```

4. Настройка секретов:
```bash
# Зашифровать vault файл
make encrypt

# Расшифровать для редактирования
make decrypt

# Редактировать зашифрованный файл
make edit-vault
```

5. Деплой приложения на удалённый сервер:

Необходимые переменные для подключения к базе, деплоя Redmine и конфигурирования Docker присутствуют в group_vars/webservers/webservers.yml.
```bash
# Стандартный деплой (требует предварительной настройки vault)
make deploy

# Или деплой с запросом пароля vault
make deploy-vault
```

Пример приложения:

<a href="https://exampledev.ru/">Перейти на сайт Exampledev</a>
