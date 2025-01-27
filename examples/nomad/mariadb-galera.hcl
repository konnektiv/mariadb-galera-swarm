# Ports require lots of reconfiguration..
# https://mariadb.com/kb/en/configuring-mariadb-galera-cluster/#network-ports

# Stuck on WSL-related issue:
# failed to setup alloc: pre-run hook "network" failed: failed to configure networking for alloc: failed to configure network: plugin type="loopback" failed (add): failed to Statfs "/var/run/docker/netns/8a3dd4a21ef8": no such file or directory

job "mariadb" {
  type = "service"

  group "node" {
    count = 3
    network {
      mode = "bridge"
      port "server" {
        static = 3306
        to = 3306
      }
      port "recovery" {
        static = 3309
        to = 3309
      }
      port "sst" {
        static = 4444
        to = 4444
      }
      port "gcomm" {
        static = 4567
        to = 4567
      }
      port "gcomm2" {
        static = 4568
        to = 4568
      }
      port "node-health" {
        static = 8080
        to = 8080
      }
      port "cluster-health" {
        static = 8081
        to = 8081
      }
    }

    service {
      name     = "mariadb-server"
      port     = "server"
      provider = "nomad"
    }

    task "mariadb-server" {
      driver = "docker"
      config {
        image = "colinmollenhour/mariadb-galera-swarm:10.11.6-2023-12-09"
        ports = ["server","recovery","sst","gcomm","gcomm2","node-health","cluster-health"]
        command = "node"
        args = ["??"]
        volumes = [
          "data:/var/lib/mysql"
        ]
      }
      env {
        NODE_ADDRESS = "${NOMAD_ADDR_gcomm}"
        XTRABACKUP_PASSWORD = "foobar"
        SKIP_TZINFO = 1
        GCOMM_MINIMUM = 1
      }
      service {
        name     = "mariadb-gcomm"
        port     = "gcomm"
        provider = "nomad"
      }
      template {
        data        = <<EOH
GCOMM_NODES={{- range nomadService "mariadb-gcomm" }}{{ .Address }}:{{ .Port }},{{- end }}
EOH
        destination = "local/env.txt"
        env         = true
      }
    }
  }
}
