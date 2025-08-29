# local_nomad_server_client_mtls
This repository is a reference to configuring mtls between nomad client and server 

# Quick Start: Local Nomad Cluster with mTLS

This guide provides the steps to run a local, mTLS-enabled Nomad cluster using the provided Docker Compose configuration.

## Prerequisites

- Docker & Docker Compose
- Nomad CLI

---

### Step 1: Generate Certificates

Run the following commands from the project root to generate the necessary TLS certificates and move them into the `certs/` directory.

# 1. Create the Certificate Authority
nomad tls ca create

# 2. Create the Server Certificate
nomad tls cert create -server -additional-dnsname=nomad-server

# 3. Create the Client Certificate
nomad tls cert create -client

# 4. Move certificates to the correct directory
mv *.pem certs/

### Step 2: Start the Cluster
Launch the Nomad server and client containers in the background.

```bash
docker-compose up -d
```

### Step 3: Test the Cluster
Configure your terminal to communicate with the secure cluster, then check the node status.

# 1. Set environment variables for your terminal session
```bash
export NOMAD_ADDR="[https://127.0.0.1:4646](https://127.0.0.1:4646)"
export NOMAD_CACERT="$(pwd)/certs/nomad-agent-ca.pem"
export NOMAD_CLIENT_CERT="$(pwd)/certs/global-client-nomad.pem"
export NOMAD_CLIENT_KEY="$(pwd)/certs/global-client-nomad-key.pem"
```
# 2. Check the node status
nomad node status

You should see the following output, indicating the client is ready:

```bash
ID        Node Pool  DC    Name              Class   Drain  Eligibility  Status
<node-id> default    dc1   <container-name>  <none>  false  eligible     ready
```
### Step 4: Cleanup
Stop and remove the cluster containers.

```bash
docker-compose down
```
