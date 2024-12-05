Minimal example to reproduce newrelic_rpm error

To reproduce:

```bash
bundle install
NEW_RELIC_LICENSE_KEY=... NEW_RELIC_HOST=... rackup
```

In second terminal:
```bash
curl localhost:9292/test
```

Wait for events to send to new relic backend.
