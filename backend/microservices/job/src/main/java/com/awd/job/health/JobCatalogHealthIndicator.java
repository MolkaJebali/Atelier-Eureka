package com.awd.job.health;

import com.awd.job.repository.CategoryRepository;
import com.awd.job.repository.JobRepository;
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

/**
 * HealthIndicator personnalise (Atelier Actuator).
 *
 * Il verifie que le catalogue des offres est reellement lisible : une requete est
 * executee sur les tables job et category. Le composant apparait dans
 * /actuator/health sous le nom "jobCatalog" (nom du bean sans le suffixe HealthIndicator).
 * Il passe DOWN si la requete echoue (ex. MySQL arrete) et il est pris en compte
 * dans le statut global, donc dans le statut publie vers Eureka.
 */
@Component
public class JobCatalogHealthIndicator implements HealthIndicator {

    private final JobRepository jobRepository;
    private final CategoryRepository categoryRepository;

    public JobCatalogHealthIndicator(JobRepository jobRepository, CategoryRepository categoryRepository) {
        this.jobRepository = jobRepository;
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Health health() {
        try {
            long jobs = jobRepository.count();
            long categories = categoryRepository.count();
            return Health.up()
                    .withDetail("jobs", jobs)
                    .withDetail("categories", categories)
                    .build();
        } catch (Exception ex) {
            return Health.down()
                    .withDetail("reason", "Catalogue des offres inaccessible")
                    .withException(ex)
                    .build();
        }
    }
}
