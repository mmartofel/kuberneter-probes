package org.acme.health;

import javax.enterprise.context.ApplicationScoped;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Startup;

import io.quarkus.logging.Log;

@Startup
@ApplicationScoped
public class SimpleStartup implements HealthCheck {

    @Override
    public HealthCheckResponse call() {
        Log.info("Startup probe checkd");
        return HealthCheckResponse.up("Startup procedure");
    }
    
}
