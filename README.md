# desmond.neuron.my

Personal portfolio for Desmond Giam, operator and full-stack engineer in Kuala Lumpur.
Static site, no build step, no framework. Four pages plus a 404.

```
index.html    hero, selected work, approach, stack, CTA
work.html     eight projects in detail
about.html    the story, timeline, and what I am good at
collab.html   hire me / build with me, process, pricing, FAQ
assets/       site.css, screenshots used on the home page
deploy.sh     rsync to the nginx box and verify
```

## Local preview

```bash
python3 -m http.server 8090
# http://localhost:8090
```

## Deploy

```bash
./deploy.sh
```

Pushes to `root@172.236.152.141:/var/www/desmond.neuron.my` using
`~/.secrets/ssh/white`. Cloudflare proxies `desmond.neuron.my` to that box and
terminates TLS, so no certificate handling is needed on the server.

nginx vhost: `desmond-neuron-my` in `/etc/nginx/sites-enabled/`, `root` set to the
directory above, `index index.html`, `error_page 404 /404.html`.

## Content rules

- Screenshots must be scrubbed of phone numbers, customer names and client text
  before they go in `assets/shots/`. The capture script lives at
  `~/portshot/shoot.js` (`--scrub` replaces phone-like strings and gambling copy).
- Client platforms under NDA are described, never named or pictured.
- No invented metrics. Numbers on the site: 6 years shipping, 7 live products,
  110 repositories, 1 business run on them.

## Editing

Copy lives in the HTML. Contact links are `wa.me/60122273341`,
`desmondgiam02@gmail.com`, and `github.com/abbyabby3366`.
