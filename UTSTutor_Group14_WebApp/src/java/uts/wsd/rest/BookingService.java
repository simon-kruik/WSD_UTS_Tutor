/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
/**
 *
 * @author Dallas Symons
 */
@Path("/booking")
public class BookingService {
@Path("test")
@GET
@Produces(MediaType.TEXT_PLAIN)
public String hello() {
 return "If you are reading this, REST is working";
}
    
    
    
    
    
}
