const app = require('./app');
const createEurekaClient = require('./config/eureka');

const PORT = process.env.PORT || 8083;

const server = app.listen(PORT, () => {
  console.log(`meeting microservice running on http://localhost:${PORT}`);
  console.log(`Swagger UI: http://localhost:${PORT}/swagger-ui`);

  // Enregistrement dans Eureka une fois le serveur demarre (desactivable avec EUREKA_ENABLED=false)
  if (process.env.EUREKA_ENABLED !== 'false') {
    const eurekaClient = createEurekaClient(PORT);
    eurekaClient.logger.level('info');
    eurekaClient.start((error) => {
      console.log(error ? `Eureka registration failed: ${error}` : 'Registered in Eureka as MEETING');
    });

    // Desenregistrement propre a l'arret (Ctrl+C) : l'instance disparait du dashboard
    const shutdown = () => {
      eurekaClient.stop(() => {
        server.close(() => process.exit(0));
      });
    };
    process.on('SIGINT', shutdown);
    process.on('SIGTERM', shutdown);
  }
});
