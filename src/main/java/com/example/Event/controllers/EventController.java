package com.example.Event.controllers;

import com.example.Event.entities.Event;
import com.example.Event.services.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class EventController {
    private final EventService eventService;

    @GetMapping("/events")
    public String events(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("events", eventService.listEvents(title));
        model.addAttribute("user", eventService.getUserByPrincipal(principal));
        return "events";
    }

    @GetMapping("/events/{id}")
    public String eventInfo(@PathVariable Long id, Model model) {
        Event event = eventService.getEventById(id);
        model.addAttribute("event", event);
        model.addAttribute("images", event.getImages());
        return "event-info";
    }

    @PostMapping("/events/create")
    public String createEvent(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Event event, Principal principal) throws IOException {
        eventService.saveEvent(principal, event, file1, file2, file3);
        return "redirect:/events";
    }

    @PostMapping("/events/delete/{id}")
    public String deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "redirect:/events";
    }
}
