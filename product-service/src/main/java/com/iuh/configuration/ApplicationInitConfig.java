package com.iuh.configuration;

import com.iuh.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = lombok.AccessLevel.PRIVATE)
public class ApplicationInitConfig {

    @NonFinal
    @Value("${server.port}")
    String serverPort;

    CategoryRepository categoryRepository;

    @Bean
    @ConditionalOnProperty(
            prefix = "spring",
            value = "datasource.driver-class-name",
            havingValue = "com.mysql.cj.jdbc.Driver")
    ApplicationRunner applicationRunner() {
        log.info("Initializing application.....");
        return args -> {
            try {
                String targetCategoryId = "7";
                if (categoryRepository.findById(targetCategoryId).isPresent()) {
                    categoryRepository.deleteById(targetCategoryId);
                    log.info("Deleted category with id={}", targetCategoryId);
                } else {
                    log.info("No category found with id={}, nothing to delete", targetCategoryId);
                }
            } catch (Exception e) {
                log.error("Error while attempting to delete category id=7: {}", e.getMessage(), e);
            }
            log.info("Application initialization completed .....");
            log.info("swagger-ui: http://localhost:{}/product-service/swagger-ui.html", serverPort);
        };
    }
}
