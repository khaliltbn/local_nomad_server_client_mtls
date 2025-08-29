# config/server.hcl
data_dir  = "/nomad/data"
bind_addr = "0.0.0.0"

server {
  enabled          = true
  bootstrap_expect = 1
}

tls {
  http = true
  rpc  = true

  ca_file   = "/nomad/certs/nomad-agent-ca.pem"
  cert_file = "/nomad/certs/global-server-nomad.pem"
  key_file  = "/nomad/certs/global-server-nomad-key.pem"

  verify_server_hostname = true
  verify_https_client    = true
}
