/**
 * Enregistrement du microservice Meeting dans Eureka (Atelier Eureka, Partie 3 + Atelier Actuator, Partie 5).
 *
 * - nom dans Eureka : MEETING
 * - le port est lu dans la variable d'environnement PORT (plusieurs instances possibles)
 * - healthCheckUrl / statusPageUrl pointent vers les routes /health et /info de l'application
 */
const { Eureka } = require('eureka-js-client');

const createEurekaClient = (port) => {
  const hostName = process.env.HOST_NAME || 'localhost';
  const ipAddr = process.env.IP_ADDR || '127.0.0.1';
  const baseUrl = `http://${hostName}:${port}`;

  return new Eureka({
    instance: {
      app: 'MEETING',
      instanceId: `${hostName}:meeting:${port}`,
      hostName,
      ipAddr,
      port: { $: Number(port), '@enabled': true },
      vipAddress: 'meeting',
      statusPageUrl: `${baseUrl}/info`,
      healthCheckUrl: `${baseUrl}/health`,
      homePageUrl: `${baseUrl}/api/meetings/hello`,
      dataCenterInfo: {
        '@class': 'com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo',
        name: 'MyOwn',
      },
    },
    eureka: {
      host: process.env.EUREKA_HOST || 'localhost',
      port: Number(process.env.EUREKA_PORT || 8761),
      servicePath: '/eureka/apps/',
      maxRetries: 10,
      requestRetryDelay: 2000,
    },
  });
};

module.exports = createEurekaClient;
