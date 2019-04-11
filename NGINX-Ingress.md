# NGINX Ingress Setup

NGINX Ingress is an ingress controller which allows for the routing of external requests to pods. It is the source for application metrics by default.

# Setup procedure
Install NGINX ingress using the following command:
```sh
helm install stable/nginx-ingress --namespace kube-system --set controller.stats.enabled=true,\
controller.metrics.enabled=true,\
controller.service.type=NodePort \
--name ingress
```

Once the NGINX ingress controller is installed, you may add Ingresses to access your services. This is useful for our project because Telegraf can hook into the metrics exposed by the ingress controller and receive insight into some application metrics such as how long responses are taking or how many requests are being received.

The YAML for an Ingress service that would allow you to connect to a NodePort service named 'web' running on port 8081 is as follows:

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    ingress.kubernetes.io/rewrite-target: /
    ingress.kubernetes.io/ssl-redirect: "False"
spec:
  rules:
  - host: host-2.skytap.example
    http:
      paths:
        - path: /
          backend:
            serviceName: web
            servicePort: 8081
```

Note that the 'host' value represents the DNS name of a node in the Kubernetes cluster, which in this case uses the skytap.example network that comes with a skytap environment.

Once this is done, you can access the exposed service by connecting to the specified hostname on the port the ingress controller is bound to. In the case of a bare-metal installation, this will be visible on the NodePort service representing the Ingress controller.

The url for this example would be host-2.skytap.example:30932 for a NodePort bound on port 30932.
