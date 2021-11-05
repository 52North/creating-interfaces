# Creating Interfaces - Deployment

This repository contains the setup for deploying Citizen Science data collection tools developed within the <a target="_blank" href="https://creatinginterfaces.eifer.kit.edu/">Creating Interfaces</a> project on a public server.

The setup uses Apache HTTP Server, Caddy, PostgreSQL and Docker/Docker Compose. 

There are two different tools included in the deplyoment:
* Slupsk Tool: https://github.com/52North/slupsk-tool
* Tulcea Tool: https://github.com/52North/tulcea-tool

### Deployment steps

* Clone this repository including the submodules: `git clone --recurse-submodules https://github.com/52North/creating-interfaces.git`
* Go to project root: `cd creating-interfaces`
* If the checked commit in the submodule does not contain recent changes: `git submodule update --remote`
* Create an `.env` file with the following content
  ```
  SLUPSK_DB_PW=<your-pw>                                                                                                                                         
  SLUPSK_SECRET_KEY=<your-key>
  TULCEA_DB_PW=<your-pw>
  TULCEA_SECRET_KEY=<your-key>
  ```
* Change the server name in `TulceaTool.conf`, `SlupskTool.conf` and `caddy/Caddyfile` to your domain
* Build the docker images: `docker compose build`
* Start the docker containers: `docker compose up -d`
* Once the containers are running, you can create a super user account:
  * Execute an interactive bash shell on the container: `docker exec -it <container-id> /bin/bash`
  * Activate virtual environment: `. venv/bin/activate`
  * Create super user account: `db/manage.py createsuperuser` 

If you only want to deploy one tool, you can comment the respective services and volumes in the `docker-compose.yml`.

Funding organizations/projects
-------

The development of creating-interfaces was supported by several organizations and projects. Among other we would like to thank the following organisations and project

| Project/Logo | Description |
| :-------------: | :------------- |
| <a target="_blank" href="https://creatinginterfaces.eifer.kit.edu/"><img alt="Creating Interfaces - capacity building for the urban food-water-energy (FWE) -nexus" align="middle" width="250" src="https://creatinginterfaces.eifer.kit.edu/wp-content/uploads/2018/06/logo_creating-interfaces_250x104.png"/></a><a target="_blank" href="https://ec.europa.eu/programmes/horizon2020/en/home"><img alt="This project has received funding from the European Union's Horizon 2020 research and innovation programme under grant agreement No 730254" align="middle" width="1000" src="https://creatinginterfaces.eifer.kit.edu/wp-content/uploads/2018/06/logo_eu-600x160.png"/></a> | The development of this version of creating-interfaces was supported by the <a target="_blank" href="https://ec.europa.eu/programmes/horizon2020/en/home">European Union's Horizon 2020 research and innovation programme</a> (grant agreement No 730254) within the research project <a target="_blank" href="https://creatinginterfaces.eifer.kit.edu/">Creating Interfaces</a>. |
