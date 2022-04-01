package org.acme;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.flywaydb.core.Flyway;

import io.quarkus.logging.Log;

@ApplicationScoped
public class MigrationService {
    
    // You can Inject the object if you want to use it manually
    @Inject
    Flyway flyway; 

    public void checkMigration() {
        // This will print actual Flyway schema version.
        Log.info(flyway.info().current().getVersion().toString());
    }
}