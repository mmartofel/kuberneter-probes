package org.acme.health;

import javax.enterprise.context.ApplicationScoped;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.Liveness;

@Liveness
@ApplicationScoped
public class SimpleLiveness implements HealthCheck{
    
    @Override
    public HealthCheckResponse call() {
        return HealthCheckResponse.up("Liveness procedure");
    }
}
