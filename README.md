## mockdb - Purpose

This a Repo designed to create your own local static MySQL database containing multiple Schemas and Tables. This allows you to not only bring down the necessary data required to run the project locally on your machines for web development purposes, but also develop scripts off of a non-production db.

## mockdb - Directions - Confirm MySQL Schemas/Tables

Please check the folder: `local-dumps` for any data you need to export from a live db.

####  STEP 1:
The entire Schemas of are contained in "local-dumps" folder that comes with this repo, check there to see if you see the desired Schemas/Tables.

####  STEP 2:
If these are not the schemas you want to test with, then you will need to connect to your production MySQL instance via MySQL Workbench.

####  STEP 3:
Once you have opened MySQL Workbench and connected to the production Instance, go to `Data Export` in the top left menu of the left sidebar.

####  STEP 4:
In the `Table to Export` section, select the Schemas and Tables you want to export in the left and right hand windows. Take note of what is already in the `local-dumps` folder.

####  STEP 5:
Make sure `Dump Structure and Data` is selected.

####  STEP 6:
You can leave the `Objects to Export` section unchecked. Otherwise, in the `Export Options` section you can use `Export to Dump Project Folder` or `Export to Self-Contained File` (Which will be too big to post to github). Either way, the `*.sql` files from the export must end up in the fork folder of `mockdb/local-dumps`. Ensure that the `Include Create Schema` checkbox is checked. If that box is left unchecked, your SQL data will not be imported properly.

  	NOTE: If there is SQL data that you think belongs in the github repo, feel free to make a Pull Request. Do NOT leave out any of the SQL files in local-dumps as it may break Weapon X if you are trying to run it locally on your machine.

####  STEP 7:
The `Advanced Options` section: `Create Options, Quote-Names, Dump-date, Disable-keys, tx-utc, extended-insert`

  	NOTE: These options are the only ones Jonathan leaves selected, and work for him; but that does not mean checking other boxes or unchecking them matters.


## mockdb - Directions - Initialize Container

You have to create a Docker ID here: https://cloud.docker.com/
Software needed: https://store.docker.com/editions/community/docker-ce-desktop-mac?tab=description
This installs the Docker Daemon so you can use the terminal commands.

#### STEP 1:
Fork the Repository and download to your machine.
  	NOTE: you can use github desktop or the command line via the following documentation: https://help.github.com/categories/managing-remotes/

#### STEP 2:
Open Terminal and go to the `../mockdb` directory on your machine

#### STEP 3:
From the repo folder on your machine ../mockdb. Run the following: `$ docker-compose build`

	NOTE: This will take sometime as it has to download Debian software images
          If you see anything asking for a MySQL root password, do not enter anything.
          The root password has already been set to iamgroot


#### STEP 4:
Once you get the "Successfully Built" message from Docker. Run the following: `$ docker-compose up -d`

#### STEP 5:
Let's confirm that your Docker file of a static snapshot of mockdb works properly. Run: `$ docker ps`, `$ docker ps -a` will show ALL containers, start or stopped.

        Expected (Approx) Response:
        CONTAINER ID        IMAGE               COMMAND               CREATED             STATUS              PORTS                    NAMES
        aa9bfe83fa1f        mockdb_live       "/tmp/mysql_run.sh"   37 seconds ago      Up 36 seconds       0.0.0.0:3306->3306/tcp   mockdb_1


#### STEP 6:
Try Connecting to your local mockdb through MySQL Workbench:

Connection Name: `Whatever your heart desires`

Connection Method: `Standard (TCP/IP)

Hostname: `127.0.0.1`

Port: `3306`

Username: `groot`

Password: `iamgroot`


## mockdb - Directions - Removing Containers and Images

Good Tutorial: https://deninet.com/topics/docker

Understanding Docker Images and Containers: https://docs.docker.com/engine/getstarted/step_two/

Dockerfile Reference: https://docs.docker.com/engine/reference/builder/

Commands to know:
`docker ps` - Show Running Containers

`docker ps -a` - Show All Containers

`docker start <Container Name or ID>` - Start a Container

`docker stop <Container Name or ID>` - Stop a Container

`docker images` - Show All Docker Images.

`docker rm <Container Name or ID>` - Delete Container (Container must be Stopped)

`docker rmi <Image Name or ID>` - Delete Image (Associated Containers must be Deleted)


##### IMPORTANT: If you are attempting to rebuild a Docker container with new SQL data after you have already created a mockdb container. It would be helpful to just start over and remove the Containers and Images, but is not necessarily required. Remove in order `Stop Container` then `Remove Container`, then `Remove Image`. Then go through the `Initialize Containers` Directions again.
