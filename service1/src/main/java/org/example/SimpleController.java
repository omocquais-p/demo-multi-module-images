package org.example;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SimpleController {

    @GetMapping("/customers")
    public List<Customer> customers() {
        return List.of(new Customer("John"));
    }
}
