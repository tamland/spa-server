# SPA server

Express.js server and Docker image for runtime configuration of Single Page Apps via environment variables.


## Example usage

index.html

```html
<html>
  <head>
    <script type=text/javascript src="/env.js"></script>
  </head>
  <body>
    <p id="app"></p>
    <script>
      document.getElementById("app").innerHTML = window._env.MSG1 + " " + window._env.MSG2;
    </script>
  </body>
</html>
```

Dockerfile

```dockerfile
FROM tamland/spa-server

ENV EXPOSE_VARS="MSG1 MSG2"
COPY index.html /var/www/html/
```

Start
```bash
$ docker run -p 8080:8080 -e MSG1=Hello -e MSG2=world helloworld:latest
```
