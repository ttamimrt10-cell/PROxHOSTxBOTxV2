Render Hosting Bot updated files

- app.py: Original uploaded TAMIM File Host bot, with environment-based owner/admin/contact settings, optional local .env loading, and /health endpoint.
- .env.example: Placeholder-only example. Copy to .env for local development; do not commit .env.
- requirements.txt: Dependencies used by app.py, including python-dotenv.

Render settings:
- healthCheckPath: /health
- Set BOT_TOKEN, OWNER_ID, ADMIN_ID, YOUR_USERNAME, UPDATE_CHANNEL in Render Environment.
- Binance variables are optional unless you use Binance Pay.

Important: Render Free web-service filesystem is ephemeral. SQLite data and uploaded scripts can be lost on restart/redeploy unless you use suitable persistent storage or external database/storage.
