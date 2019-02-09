package controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventController {

  @RequestMapping(value = "/test", method = RequestMethod.GET)
  public ResponseEntity<Object> test() {
    return new ResponseEntity<>("working", HttpStatus.OK);
  }

}
