package org.acme.health;

import javax.enterprise.context.ApplicationScoped;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Liveness;

import io.quarkus.logging.Log;

@Liveness
@ApplicationScoped
public class SimpleLiveness implements HealthCheck{
    
    @Override
    public HealthCheckResponse call() {
        Log.info("Liveness probe checkd");
        return HealthCheckResponse.up("Liveness procedure");
    }
}
