FROM hbpmip/meta-db-setup:2.0.0
MAINTAINER Ludovic Claude <ludovic.claude@chuv.ch>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

COPY variables.json /src/variables/mip-cde.json
ENV CDE_DEFINITIONS="mip-cde" \
    CDE_TARGET_TABLES="MIP_CDE_DATA"

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="hbpmip/sample-meta-db-setup" \
      org.label-schema.description="Meta database setup with sample-data variables" \
      org.label-schema.url="https://github.com/LREN-CHUV/sample-meta-db-setup" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/LREN-CHUV/sample-meta-db-setup" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version="$VERSION" \
      org.label-schema.vendor="LREN CHUV" \
      org.label-schema.license="Apache2.0" \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.schema-version="1.0"
