# This dockerfile is created to build a customized keycloak docker image which will contain custom themes and realm. It has 2 stages(Builder and Final)- 
# 1.) The builder stage configures the database provider, here mysql, and executes kc.sh build. This is where the optimized build is created.
# 2.) The final stage uses the builder stage and simply copies the build output into the final container.

# -------------- Builder Stage -------------------- #
FROM quay.io/keycloak/keycloak:22.0.3 as builder

# Set environment variables before building optimized image. These will then be set in the image.

# Build an optimized Keycloak image
RUN /opt/keycloak/bin/kc.sh build

# ------------- Final Stage ------------------------#
FROM quay.io/keycloak/keycloak:22.0.3
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY themes/ /opt/keycloak/themes/

WORKDIR /opt/keycloak

# Create an initial administrator account by setting admin env variables below
# ENV KEYCLOAK_ADMIN=admin
# ENV KEYCLOAK_ADMIN_PASSWORD=admin@123

# Expose port 80 to the Docker host, so we can access it 
# from the outside.
# EXPOSE 80

EXPOSE 8080

# Start keycloak with required command line options.
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]







