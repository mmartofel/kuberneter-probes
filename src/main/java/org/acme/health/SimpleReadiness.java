package org.acme.health;

import java.sql.SQLException;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;

import org.eclipse.microprofile.health.HealthCheck;
import org.eclipse.microprofile.health.HealthCheckResponse;
import org.eclipse.microprofile.health.HealthCheckResponseBuilder;
import org.eclipse.microprofile.health.Readiness;

import io.agroal.api.AgroalDataSource;
import io.quarkus.logging.Log;

@Readiness
@ApplicationScoped
@Transactional
public class SimpleReadiness implements HealthCheck{

@Inject
AgroalDataSource defaultDataSource;

    private boolean databaseUp;
    private String databaseVendor;
    private String databaseVersion;
    private String databaseJDBCString;

    @Override
    public HealthCheckResponse call() {

        HealthCheckResponseBuilder responseBuilder = HealthCheckResponse.named("Postgress database readiness check");
        
        try {
            simulateDatabaseConnectionVerification();
            databaseVendor = defaultDataSource.getConnection().getMetaData().getDatabaseProductName();
            databaseVersion = defaultDataSource.getConnection().getMetaData().getDatabaseProductVersion();
            databaseJDBCString = defaultDataSource.getConnection().getMetaData().getURL();
            responseBuilder.withData("database_vendor", databaseVendor);
            responseBuilder.withData("database_version", databaseVersion);
            responseBuilder.withData("database_url", databaseJDBCString);
            responseBuilder.up();
        } catch (SQLException e) {
            responseBuilder.withData("error", e.toString());
            responseBuilder.down();
        }
        return responseBuilder.build();
    }

    private void simulateDatabaseConnectionVerification() throws SQLException {

        databaseUp = !defaultDataSource.getConnection().isClosed();

        Log.info("Checking database connection status for: " + defaultDataSource.getConnection().getMetaData().getDatabaseProductName());
        Log.info("Agroal datasource reachable: " + databaseUp);
        Log.info("Autocommit: " + defaultDataSource.getConnection().getAutoCommit());
        
        if (!databaseUp) {
            throw new SQLException("Cannot contact database");
        }
    }

}
