db = db.getSiblingDB('admin');
db.createUser({
  user: 'exporter',
  pwd: 'exporter-password',
  roles: [
    { role: 'clusterMonitor', db: 'admin' },
    { role: 'read', db: 'local' }
  ]
});
