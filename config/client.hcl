data_dir = "/nomad/data"

client {
  enabled = true
  servers = ["nomad-server:4647"]
}

ports {
  http = 14646
}

tls {
  rpc_upgrade_mode = true
  rpc              = true
  ca_file          = "/nomad/certs/nomad-agent-ca.pem"
  cert_file        = "/nomad/certs/global-client-nomad.pem"
  key_file         = "/nomad/certs/global-client-nomad-key.pem"
}
