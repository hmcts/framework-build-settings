# Travis Maven Settings

This project contains a Maven settings.xml that Travis can use for builds.

## ROOT-CA

Presently we're deploying to a private Nexus repository which has its own Root CA Certificate.
This needs to be added to the Java trust store for deployments to work.
