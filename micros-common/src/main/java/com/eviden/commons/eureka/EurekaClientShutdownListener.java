package com.eviden.commons.eureka;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.stereotype.Component;

import com.netflix.discovery.EurekaClient;

/**
 * Listener que escuchará el evento de cierre del contexto de Spring Boot
 *  para de-registrar la instancia del servidor Eureka correctamente, evitando
 *  el cierre prematuro del Connection pool HTTP */
@Component
public class EurekaClientShutdownListener implements ApplicationListener<ContextClosedEvent> {

    @Autowired
    private EurekaClient eurekaClient;

    @Override
    public void onApplicationEvent(ContextClosedEvent event) {
        if (eurekaClient != null) {
            eurekaClient.shutdown();
        }
    }
}