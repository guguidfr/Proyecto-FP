#/bin/bash
echo 'use admin
db.createUser(
  {
    user: "exporter",
    pwd: "exporter-password",
    roles: [
        { role: "clusterMonitor", db: "admin" },
        { role: "read", db: "local" }
    ]
  }
)' | mongo
