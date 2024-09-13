
# Big challenge
<img width="703" alt="image" src="https://user-images.githubusercontent.com/75510135/125434594-d957dafd-cc60-44cf-a6bc-a1c9301f8001.png">

<img width="710" alt="image" src="https://user-images.githubusercontent.com/75510135/125435247-7a4b36fb-f0a3-4d2e-991e-9529f868e75e.png">

- Solution

<img width="725" alt="image" src="https://user-images.githubusercontent.com/75510135/125436475-07b352b1-e451-48d2-9ada-068ab2c916ac.png">

<img width="925" alt="image" src="https://user-images.githubusercontent.com/75510135/125437209-76037592-f4e8-4cd8-9f9a-1b10df177f6e.png">

# Resources
<img width="718" alt="image" src="https://user-images.githubusercontent.com/75510135/125452066-12091d13-678e-49cd-bad8-3f168a53bd95.png">

<img width="688" alt="image" src="https://user-images.githubusercontent.com/75510135/125452135-b2889b51-ec81-403e-bef6-af8b79a9a7a0.png">

<img width="708" alt="image" src="https://user-images.githubusercontent.com/75510135/125452573-0b390c84-adaf-4ead-bdc7-6ac497903a8c.png">

<img width="823" alt="image" src="https://user-images.githubusercontent.com/75510135/125452718-c727b89b-124d-4edb-abcf-c3b8540da9b9.png">
# Auth Service Setup
<img width="880" alt="image" src="https://user-images.githubusercontent.com/75510135/125452812-6df8fa92-bb7d-465d-b04b-be1f3d41596c.png">
<img width="689" alt="image" src="https://user-images.githubusercontent.com/75510135/125708824-4d7f6f91-274e-422c-a4a1-3d358bca7f10.png">
<img width="733" alt="image" src="https://user-images.githubusercontent.com/75510135/125708927-30c9a473-93fa-4c84-a366-6e2766e7f192.png">

auth $ tsc --init

- here is the basic code for the app  @ start
https://github.com/rupeshpanwar/microsvc-mulitisvc-app

<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125664191-819d9b6d-7592-42e7-844d-881b04810a74.png">
# App Code
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125708543-b20cf4e0-0fd7-434e-8205-2a3a0ef95fbb.png">
Note on Code Reloading

Hi!

If you did not see your server restart after changing the index.ts file, do the following:

    Open the package.json file in the ‘auth’ directory

    Find the ‘start’ script

Update the start script to the following:

ts-node-dev --poll src/index.ts 



# Dockerization to prepare containerization for K8S

- my code
<img width="544" alt="image" src="https://user-images.githubusercontent.com/75510135/125711405-9c18ce18-2311-4198-af76-ef5da3101baa.png">

<img width="944" alt="image" src="https://user-images.githubusercontent.com/75510135/125711423-f53785a4-fbeb-4257-b733-d314430aa3eb.png">
- trainer's one
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125707533-bbebe16a-9010-460e-bbc5-f532f3d71c8b.png">
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125707554-808ebfbe-b5e9-4487-92b4-697c9b9be786.png">
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125707598-8c9bbd0b-3118-4d52-aa36-29b91eb5b1a1.png">
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125707829-52f9ac52-c0fc-4881-9f4d-da38c3e37ae1.png">
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125707966-cb21d1bb-ee40-407d-95f5-b938289d8945.png">

# Skaffold - to sync up the latest changes and deploy to container on change
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125708351-b5950be2-8bfc-46df-b8e1-352157896ca2.png">

<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125708411-d99c4bb7-972d-408f-bed9-004247cb9322.png">

# Note on Code Reloading

Hi!

If you did not see your server restart after changing the index.ts file, do the following:

    Open the package.json file in the ‘auth’ directory

    Find the ‘start’ script

Update the start script to the following:

ts-node-dev --poll src/index.ts 


# Ingress - networking.k8s.io/v1beta1 Ingress is deprecated

When skaffold dev in the upcoming lecture you may encounter a warning about the v1beta1 API version that is being used:

Warning: networking.k8s.io/v1beta1 Ingress is deprecated in v1.19+, unavailable in v1.22+; use networking.k8s.io/v1 Ingress

To be clear, any changes to the Ingress will be optional and this API will be supported until Kubernetes v1.22. If you are currently experiencing any errors or issues with your Ingress this warning is not the cause of it.

If you wish to update to the v1 API, only a few very minor changes are needed:

https://kubernetes.io/docs/concepts/services-networking/ingress/

Notably, a pathType needs to be added, and how we specify the backend service name and port has changed:

    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: ingress-service
      annotations:
        kubernetes.io/ingress.class: nginx
        nginx.ingress.kubernetes.io/use-regex: "true"
    spec:
      rules:
        - host: ticketing.dev
          http:
            paths:
              - path: /api/users/?(.*)
                pathType: Prefix
                backend:
                  service:
                    name: auth-srv
                    port:
                      number: 3000

While the old API is still supported we will include a separate v1 Ingress file attached to each appropriate lecture that students can refer to.


# Ingress-Nginx setup
<img width="1146" alt="image" src="https://user-images.githubusercontent.com/75510135/125894727-ab8197dc-03c8-465a-a410-a4df6527de73.png">

<img width="978" alt="image" src="https://user-images.githubusercontent.com/75510135/125895460-abcd79f5-101c-4d85-abad-ca0aac051fb0.png">

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress-service
  annotation:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/use-regex: 'true'
spec: 
  rules:
    - host: ticketing.dev
      http:
        paths:
          - path: /api/users/?(.*)
            backend:
              serviceName: auth-srv
              servicePort: 3000
 ```
 
 
 <img width="1231" alt="image" src="https://user-images.githubusercontent.com/75510135/125897109-457523b5-ddd1-4fd9-b444-e8cbaf7e27d0.png">


# Change hosts file
<img width="978" alt="image" src="https://user-images.githubusercontent.com/75510135/125898052-8f98870e-9efb-48da-bee4-4eb2bed9cd37.png">
<img width="978" alt="image" src="https://user-images.githubusercontent.com/75510135/125901111-e0f24875-ce96-478f-9f6e-f78dbfe13aa2.png">

# Dev Env on Google cloud
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125902347-f9db7d07-fe3b-4e48-8dd2-62b31358370c.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125903046-9e663874-c232-4e94-8d10-0b6cf41d2a4f.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125903106-9f68ce72-f5b4-451e-b7d5-cebe92ca8502.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125903265-5ba31680-a684-48e3-b12d-9dc900430915.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125903547-d1187c44-dbd4-42c0-8bda-5868a1554669.png">
# sign up 
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125903826-710bb5eb-b631-4eae-95d4-ed8f60e3855b.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125905576-23487b88-2b52-40ec-b7b8-4c2456468bd3.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125905727-446db5d7-e479-407b-ae94-6fdbe92c1c9a.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125906068-8f4dddfc-fedd-4c96-8341-fb0f38179ec9.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125906163-878b23b3-e116-4d8d-9dd5-6114bd206d59.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125908101-137ef3cd-f2cf-4d01-9721-e27cc6deb28f.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125908485-a940f01c-a763-4cb2-af1c-a99df032b952.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125908625-e6540ce4-6a82-446d-ae39-bf4af7db9209.png">

- gcloud auth login
- gcloud init
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125930147-50277316-1a3f-407d-8895-c9611765ce64.png">

<img width="1552" alt="image" src="https://user-images.githubusercontent.com/75510135/125957444-a8038116-8f60-4b31-b361-5a871fe389b7.png">
 - gcloud auth login
 - gcloud container clusters get-credentials ticketing-dev
 - gcloud config set project savvy-aileron-320007
 
# Update skaffold to sync to GCP
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125957667-bab3bfdd-7cbb-4079-98ed-7e67aaef2267.png">

<img width="1552" alt="image" src="https://user-images.githubusercontent.com/75510135/125958524-026e77da-97cf-4f9b-af8c-1315eadb36d6.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125959090-7c8e6dbb-d1e7-447c-801e-7345f64abb0c.png">
- fixes
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125959216-76c9621d-0069-4c90-ad69-23bbbd5bc46c.png">

- nginx doc

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125959364-cabbe173-bc8c-4bd3-9eb1-1f6e73fd9572.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125959583-bb1e89ca-d19b-4a86-8234-d04e143a35c4.png">
<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/125959618-608bb33c-2cae-45bb-a4b0-aa5f44b9a34c.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/126052308-4b722139-8071-4189-aeab-eec29a395b8c.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/126052358-4e2c3290-65b2-4865-80e5-0fc74e336643.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/126052362-85a0ac7f-49d4-48bf-8fcb-65377b703791.png">

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/75510135/126052371-99e3544b-990e-4f5c-a108-158b9d1227bb.png">

<img width="1043" alt="image" src="https://user-images.githubusercontent.com/75510135/126052750-bcfc7290-e42c-40a9-aafa-d861947a0ad6.png">

<img width="1043" alt="image" src="https://user-images.githubusercontent.com/75510135/126052755-346e9959-0e9d-48cd-a38b-0836756f5990.png">

<img width="1043" alt="image" src="https://user-images.githubusercontent.com/75510135/126052783-fed260ed-3953-46ba-8bf5-183007a50210.png">

<img width="1043" alt="image" src="https://user-images.githubusercontent.com/75510135/126052817-396ea45d-f981-4903-8122-1fb32603bd67.png">




















