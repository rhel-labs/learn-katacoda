`composer-cli blueprints list`{{execute}}

`composer-cli blueprints save example-http-server`{{execute}}

`printf '\n[[modules]]\nname = "nodejs"\nversion = "*"' >> example-http-server.toml`{{execute}}

`composer-cli blueprints push example-http-server.toml`{{execute}}

`composer-cli blueprints changes example-http-server`{{execute}}

`composer-cli blueprints show example-http-server`{{execute}}
