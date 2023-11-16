package org.acme;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.flywaydb.core.Flyway;

import io.quarkus.logging.Log;

import java.util.List;

@Path("/api")
public class PersonResource {

    @Inject
    Flyway flyway;

    @GET
    @Path("person/all")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Person> listAllDummyData() {
        Log.info("External call to REST point: /api/person/all number of objects returned is : " + Person.count());
        return Person.listAll();
    }

    @POST
    @Path("person/add")
    @Produces(MediaType.APPLICATION_JSON)
    @Transactional
    public Response addDummyData(Person dummyData) {
        dummyData.id = null;
        dummyData.persist();
        Log.info("External call to REST point: /api/person/add new object added : " + dummyData.name + " " + dummyData.surname + " " + dummyData.pesel);
        return Response.status(Status.CREATED).entity(dummyData).build();
    }
}
