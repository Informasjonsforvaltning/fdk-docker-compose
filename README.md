# Recommended development setup for combined fdk+begrepsregistrering cluster. 
 
## Setup

At least IntelliJ has support for multiple git repos in one project, and this can be utilized by arranging all sub-projects under one parent directory. 


1) Create directory structure:

    ```
    cd <dev root>
    
    # directory for opening all related projects in IDE at the same time
    mkdir fdk-parent
    cd fdk-parent
    
    # meta project
    git clone https://github.com/Informasjonsforvaltning/fdk-docker-compose.git
    
    # CI/CD, jenins, helm
    git clone https://github.com/Informasjonsforvaltning/fdk-config 
    
    # fdk monorepo
    git clone https://github.com/Informasjonsforvaltning/fdk.git
    
    # designsystemet
    git clone https://github.com/Informasjonsforvaltning/designsystemet.git
    
    #concept catalog
    git clone https://github.com/Informasjonsforvaltning/concept-catalogue.git
    git clone https://github.com/Informasjonsforvaltning/concept-catalogue-gui.git
    ```

1) Your working directory will be the fdk-docker-compose:

    ```
    cd fdk-docker-compose
    ```

## Use docker-compose for running the cluster

Docker compose is based on images. Please see the readme of relevant modules how to build. Only some of containers are built by docker, and in this case `docker-compose up -d --build <service>` will suffice.
    
(TODO! Use multi-stage builds, then we can build everything with docker ) 
    
    ```
    # build all images for fdk, that does not have docker-compose build
    (cd ../fdk; mvn clean install)    
    #alternatively
    (cd ../fdk; mvn clean install -DskipTests)    
            

    # build all concept-catalogue api
    (cd ../concept-catalogue; mvn clean install)
    #alternatively    
    (cd ../concept-catalogue; mvn clean install  -DskipTests)    

    # build sso 
    # Because of a keyckoak-user-storage-rest-module is required, 
    # we cannot just build from dockerfile (todo use multistage build and build java in docker)
    
    (cd ../fdk/applications/sso; ./buildDocker.sh)

    # bring up containers and build missing images
    docker-compose up -d
    ```

## Runnning frontend dev-servers on host

Docker-compose uses `.env` file for overriding variables. But when you want to run the dev servers on hosts, you need to configure and run `.envrc` based on `.envrc.template`. Optionally install [direnv](https://direnv.net/docs/installation.md) to dynamically load/unload variables based on the working directory

```
#search 
#(TODO)

# registration-react
(cd ../fdk/applications/registration-react ; npm run dev)

# concept-catalogue-gui
(cd ../concept-catalogue-gui ; npm run dev)
```