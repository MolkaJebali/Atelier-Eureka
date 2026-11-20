"""Notification microservice - entry point.

Run:  uvicorn app.main:app --reload --port 8084
  or: python -m app.main
"""
import os
from contextlib import asynccontextmanager

from fastapi import FastAPI
from py_eureka_client import eureka_client

from app.routers import notification

# Le port de l'instance est lu dans la variable d'environnement PORT (plusieurs instances possibles).
# Attention : il doit etre identique a l'option --port d'uvicorn (voir run-notification.bat).
PORT = int(os.getenv("PORT", "8084"))
HOST_NAME = os.getenv("HOST_NAME", "localhost")
EUREKA_SERVER = os.getenv("EUREKA_SERVER", "http://localhost:8761/eureka")
EUREKA_ENABLED = os.getenv("EUREKA_ENABLED", "true").lower() != "false"
BASE_URL = f"http://{HOST_NAME}:{PORT}"


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Demarrage : enregistrement dans Eureka. Arret : desenregistrement."""
    if EUREKA_ENABLED:
        await eureka_client.init_async(
            eureka_server=EUREKA_SERVER,
            app_name="NOTIFICATION",
            instance_id=f"{HOST_NAME}:notification:{PORT}",
            instance_host=HOST_NAME,
            instance_ip="127.0.0.1",
            instance_port=PORT,
            home_page_url=f"{BASE_URL}/api/notifications/hello",
            status_page_url=f"{BASE_URL}/info",
            health_check_url=f"{BASE_URL}/health",
        )
    yield
    if EUREKA_ENABLED:
        await eureka_client.stop_async()

app = FastAPI(
    title="Notification Microservice API",
    version="1.0.0",
    description=(
        "Notification microservice (Python / FastAPI, no database). "
        "Only the hello endpoint is implemented; the notification logic is to be developed by students."
    ),
    contact={"name": "Badia Abouhdid"},
    servers=[{"url": f"http://localhost:{PORT}", "description": "Local"}],
    # Same URLs as the other microservices of the project
    docs_url="/swagger-ui",       # Swagger UI
    openapi_url="/v3/api-docs",   # OpenAPI JSON
    redoc_url="/redoc",           # alternative documentation
    lifespan=lifespan,
)

app.include_router(notification.router)


# ---- Observabilite (Atelier Actuator) ----
@app.get("/health", tags=["Observabilite"], summary="Etat du service (utilise par Eureka)")
def health() -> dict:
    return {"status": "UP"}


@app.get("/info", tags=["Observabilite"], summary="Nom et version du service")
def info() -> dict:
    return {
        "name": "notification",
        "version": app.version,
        "description": "Microservice de notifications (Python / FastAPI)",
    }

# TODO (students): if you add other routers, include them here.


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("app.main:app", host="0.0.0.0", port=PORT, reload=True)
