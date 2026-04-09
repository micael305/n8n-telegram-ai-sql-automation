# n8n Workflows

Este repositorio contiene dos proyectos de automatizacion con n8n:

1. `database-automation`: entorno local con Docker (n8n + Postgres) y flujo de consultas SQL.
2. `telegram-bot`: flujo de bot para Telegram.

## Estructura

```text
workflows/
	database-automation/
		.env
		.env.example
		docker-compose.yml
		scripts/
			init.sql
		text-to-sql-agent.json
	telegram-bot/
		my-chat-bot.json
```

## Proyecto 1: database-automation

Incluye:

1. Un contenedor de Postgres inicializado con datos de ejemplo.
2. Un contenedor de n8n.
3. Un flujo exportado en `text-to-sql-agent.json`.

### Variables de entorno

Archivo de referencia: `workflows/database-automation/.env.example`

Pasos:

1. Copia `workflows/database-automation/.env.example` a `workflows/database-automation/.env`.
2. Ajusta los valores si lo necesitas.

Variables incluidas:

- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_DB`
- `POSTGRES_PORT`
- `N8N_PORT`
- `N8N_WEBHOOK_URL`

### Levantar servicios

Desde `workflows/database-automation` ejecuta:

```bash
docker compose up -d
```

n8n quedara disponible por defecto en `http://localhost:5678`.

### Conexion de Postgres desde n8n

Si n8n corre dentro de Docker, usa estos valores:

- Host: `db`
- Port: `5432`
- Database: `your_database_name`
- User: `your_user`
- Password: `your_secure_password`

No uses `localhost` como host para Postgres desde dentro del contenedor de n8n.

## Proyecto 2: telegram-bot

Incluye un workflow exportado en `workflows/telegram-bot/my-chat-bot.json`.

Pasos sugeridos:

1. Abre n8n.
2. Importa el archivo JSON del flujo.
3. Configura credenciales de Telegram y cualquier variable necesaria en nodos del flujo.
4. Activa el workflow.

## Importar workflows en n8n

Para cualquier JSON exportado:

1. En n8n, selecciona Import workflow.
2. Elige el archivo `.json` correspondiente.
3. Revisa credenciales, URLs y variables antes de activar.
