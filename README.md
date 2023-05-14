# Ignition Lab

Ignition Lab is a project that provides a set of shell scripts and a Docker Compose file to create two services, "sql" and "ignition". The "sql" service consists of a Microsoft SQL Server 2019 container, and the "ignition" service consists of an "Ignition SCADA" server container. Data for the containers is persisted using Docker local volumes.

## Prerequisites

- WSL2 with Ubuntu or your variant of choice (https://learn.microsoft.com/en-us/windows/wsl/install)
- Docker Desktop (https://www.docker.com/products/docker-desktop/)
- SQL Management Studio (https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)

A helpful guide on how to expose Docker Desktop to your WSL2 distro is here: https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers#install-docker-desktop

## Usage

To use Ignition Lab, follow these steps:

1. Clone the repository to your local machine.
2. Navigate to the cloned repository directory.
3. Edit the two files in `secrets/` to set a password for the Ignition `admin` user and SQL `sa` account.

### Starting and Configuring Ignition
1. Open a terminal in the directory and run the following command to start the containers:

   ```
   sh start-ignition.sh
   ```

2. Wait for the containers to start up. You can view the logs using the following command:

   ```
   docker compose logs -f
   ```

3. Using SQL Server Management Studio, log into the SQL instance using the `sa` account.
4. Create a new empty database named `ignition` (or whatever you want, really.)
5. Create a new SQL user for Ignition and record the username and password for later
6. Open the Ignition web interface server at `http://localhost:8088`
7. Proceed through the setup wizard
8. Open the Settings panel using the gear icon
9. Configure a new database, using the details from step 5

### Stopping Ignition
To stop the containers, run the following command:

   ```
   sh stop-ignition.sh
   ```

### Cleaning up
To destroy the containers and remove all associated data, run the following command:

   ```
   sh destroy-ignition.sh
   ```

## Docker Compose

The Docker Compose file in this project creates two services:

- `sql`: A Microsoft SQL Server 2019 container with data persisted in a Docker local volume. SQL listens on port 1433, and the SA password is set using file `secrets/mssql-sa-password.txt`
- `ignition`: An Ignition SCADA server container with data persisted in a Docker local volume. Ignition listens on port 8088, and the gateway password for the default `admin` user is set using file `secrets/gateway-admin-password.txt`

## Shell Scripts

The following shell scripts are provided to manage the containers:

- `start-ignition.sh`: Starts the containers.
- `stop-ignition.sh`: Stops the containers.
- `destroy-ignition.sh`: Stops and removes the containers, and deletes all associated data.

## Credits

Ignition Lab was created by [Your Name Here]. Feel free to use and modify this project as you see fit.