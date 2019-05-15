After completing this scenario, users will be able to build images from scratch or existing base images using host based tools.

#Concepts included in this scenario:
* Creating a working container for image building
* Using buildah commands to modify a working container
* Using host tools to modify a working container
* Creating a final image from a working container

# Example Usecase:
Using podman with OCIFile or Dockerfile input is a common way to build containers, but can create images that have extra packages not needed by the application.  The creation of a layer for each directive in an OCIFile can mean extra storage space consumed by final images.  Using buildah to create images provides better control over layer creation and image contents.
