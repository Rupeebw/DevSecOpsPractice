# Testing Post-event service via Postman
<img width="730" alt="image" src="https://user-images.githubusercontent.com/75510135/125284159-be935d80-e336-11eb-8a1c-2e6ab1a834ea.png">

<img width="903" alt="image" src="https://user-images.githubusercontent.com/75510135/125284642-5133fc80-e337-11eb-9745-39fa9f9429f0.png">
- Testing

<img width="1339" alt="image" src="https://user-images.githubusercontent.com/75510135/125285775-9efd3480-e338-11eb-9f05-a9b84c428247.png">

<img width="1276" alt="image" src="https://user-images.githubusercontent.com/75510135/125285817-acb2ba00-e338-11eb-86c6-c7cb32499f6b.png">

- check logs
<img width="979" alt="image" src="https://user-images.githubusercontent.com/75510135/125285659-81c86600-e338-11eb-92d8-7e091aca3dd4.png">

# process to update remaining services-components
<img width="893" alt="image" src="https://user-images.githubusercontent.com/75510135/125294986-65c9c200-e342-11eb-9081-b4b7d7dc9924.png">
<img width="545" alt="image" src="https://user-images.githubusercontent.com/75510135/125295093-83972700-e342-11eb-8979-903276dafb0b.png">

- Replace localhost to http://event-bus-service:4005 in all remaining components, comments, query, moderation
- build docker image for each of these  [docker build -t rupeshpanwar/comments/query/moderation]
- push each of these docker image       [docker push rupeshpanwar/comments/query/moderation]
- create deployment and Clusterip service to expose the pod to each other
- 
# Issue in building the image
- Solution 
- export DOCKER_BUILDKIT=0
  export COMPOSE_DOCKER_CLI_BUILD=0
  
 <img width="732" alt="image" src="https://user-images.githubusercontent.com/75510135/125296020-7b8bb700-e343-11eb-9604-4a9b4faa328b.png">

<img width="987" alt="image" src="https://user-images.githubusercontent.com/75510135/125297722-1fc22d80-e345-11eb-9fd4-87ad091b3659.png">

<img width="1147" alt="image" src="https://user-images.githubusercontent.com/75510135/125298046-70398b00-e345-11eb-9c99-8e2e3399f796.png">

<img width="1153" alt="image" src="https://user-images.githubusercontent.com/75510135/125299685-00c49b00-e347-11eb-87b2-1d84e9e866ea.png">

- lastly update the Event-bus with new service(clusterip) for remaining components

<img width="935" alt="image" src="https://user-images.githubusercontent.com/75510135/125301087-42a21100-e348-11eb-9c7b-b64fb88db8b4.png">

<img width="501" alt="image" src="https://user-images.githubusercontent.com/75510135/125302157-5306bb80-e349-11eb-9408-168202b0a483.png">

<img width="591" alt="image" src="https://user-images.githubusercontent.com/75510135/125302285-6e71c680-e349-11eb-982d-a1f89fdea635.png">

# Bring React app to container

<img width="919" alt="image" src="https://user-images.githubusercontent.com/75510135/125326839-1d210180-e360-11eb-8e26-8ea13734b000.png">

<img width="938" alt="image" src="https://user-images.githubusercontent.com/75510135/125327021-4c377300-e360-11eb-930b-6c2e51544bce.png">

<img width="932" alt="image" src="https://user-images.githubusercontent.com/75510135/125327157-6d985f00-e360-11eb-961b-7fb9782659d1.png">

<img width="924" alt="image" src="https://user-images.githubusercontent.com/75510135/125327284-90c30e80-e360-11eb-9251-45290c6d3fbe.png">

<img width="836" alt="image" src="https://user-images.githubusercontent.com/75510135/125327648-f57e6900-e360-11eb-9f9b-207998eb930d.png">


<img width="799" alt="image" src="https://user-images.githubusercontent.com/75510135/125328326-d207ee00-e361-11eb-8909-c14169111e94.png">

<img width="891" alt="image" src="https://user-images.githubusercontent.com/75510135/125328589-20b58800-e362-11eb-84c0-d66dcaab2fd1.png">

Update on Ingress Nginx Mandatory Commands

In the upcoming lecture, we will be installing Ingress Nginx. In the video, it is shown that there is a required mandatory command that needed to be run for all providers. This has since been removed, so, the provider-specific commands (Docker Desktop, Minikube, etc) are all that is required.

https://kubernetes.github.io/ingress-nginx/deploy/#provider-specific-steps

# Ingress controller
Update on Ingress Nginx Mandatory Commands

In the upcoming lecture, we will be installing Ingress Nginx. In the video, it is shown that there is a required mandatory command that needed to be run for all providers. This has since been removed, so, the provider-specific commands (Docker Desktop, Minikube, etc) are all that is required.

https://kubernetes.github.io/ingress-nginx/deploy/#provider-specific-steps

# Load balancer
<img width="907" alt="image" src="https://user-images.githubusercontent.com/75510135/125389130-59834a80-e3be-11eb-85df-0dc38c11821b.png">

<img width="610" alt="image" src="https://user-images.githubusercontent.com/75510135/125389199-761f8280-e3be-11eb-8323-b13bc00ad5e6.png">

<img width="662" alt="image" src="https://user-images.githubusercontent.com/75510135/125389325-a8c97b00-e3be-11eb-8d8b-d13d71685b1e.png">

- installation https://kubernetes.github.io/ingress-nginx/deploy/
- step1 # kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/cloud/deploy.yaml
- step2 # 

# Writing Ingress config file
<img width="879" alt="image" src="https://user-images.githubusercontent.com/75510135/125398440-ef25d680-e3cc-11eb-82ce-ecb144a08951.png">

<img width="949" alt="image" src="https://user-images.githubusercontent.com/75510135/125399701-98b99780-e3ce-11eb-90c1-3505cadbd609.png">

<img width="758" alt="image" src="https://user-images.githubusercontent.com/75510135/125400469-89871980-e3cf-11eb-90ad-80144bbf266f.png">
- final Ingress config file
<img width="475" alt="image" src="https://user-images.githubusercontent.com/75510135/125404187-fbf9f880-e3d3-11eb-8a27-d2fa34aaf30a.png">

- need to fulfil for all other components

<img width="904" alt="image" src="https://user-images.githubusercontent.com/75510135/125404769-a1ad6780-e3d4-11eb-8327-e3f55305b8b3.png">

# Important Note to Add Environment Variable

Please don't skip this!  You must make a small change to get a step shown in the next video to work correctly!

The next video is going to show the deployment of the React app to our Kubernetes cluster.  The React app will be running in a Docker container.

Unfortunately, create-react-app currently has a bug that prevents it from running correctly in a docker container.  Create-react-app does have an open issue tracking this: https://github.com/facebook/create-react-app/issues/8688


To solve this, we have to make a small update to the Dockerfile in the client folder.  Find the Dockerfile in the client folder and make the following change:

    FROM node:alpine
     
    # Add the following line 
    ENV CI=true
     
    WORKDIR /app
    COPY package.json ./
    RUN npm install
    COPY ./ ./
     
    CMD ["npm", "start"]

Then save the file.  That's it!  Continue on to the next video.


# SetUp ReactApp inside Pod
<img width="881" alt="image" src="https://user-images.githubusercontent.com/75510135/125405292-32844300-e3d5-11eb-93ea-eb654cd500ff.png">

- update post.com/posts in all files @ client react project

<img width="910" alt="image" src="https://user-images.githubusercontent.com/75510135/125406748-cd315180-e3d6-11eb-9d1a-057278ed98cd.png">

<img width="885" alt="image" src="https://user-images.githubusercontent.com/75510135/125406840-e33f1200-e3d6-11eb-81e3-a0656082db3d.png">

<img width="899" alt="image" src="https://user-images.githubusercontent.com/75510135/125406888-f0f49780-e3d6-11eb-8cf0-fe2718464345.png">

- build docker image for client app
- docker push 
- create client-deployment manifest file & service one
- apply kubectl apply -f to run app as pod

```
 docker build -t rupeshpanwar/client .
 docker push rupeshpanwar/client
 kubectl apply -f ingress-srv.yml 
 kubectl apply -f client-depl.yaml 
```

# Routes for different application components
<img width="579" alt="image" src="https://user-images.githubusercontent.com/75510135/125412558-a8d87380-e3dc-11eb-8298-d95c280c2e41.png">

<img width="584" alt="image" src="https://user-images.githubusercontent.com/75510135/125413054-a59b5a9d-1f0b-4ac1-ba66-b529c011ef3a.png">

- change the routes in Client app and respective application

<img width="911" alt="image" src="https://user-images.githubusercontent.com/75510135/125413190-b4b503f7-07ac-411b-9b43-60f4a748f053.png">
<img width="940" alt="image" src="https://user-images.githubusercontent.com/75510135/125413255-3d3594fa-029e-4f46-a161-7a19d2106708.png">

- build docker image for client then for posts
- deploy the manifest for client then for posts
<img width="464" alt="image" src="https://user-images.githubusercontent.com/75510135/125415798-d4f0937a-042f-4ec8-b85f-03cd1d68ec87.png">
<img width="542" alt="image" src="https://user-images.githubusercontent.com/75510135/125415851-84f30453-2eab-4992-aa84-85b48629a9c3.png">

# final routing config
<img width="650" alt="image" src="https://user-images.githubusercontent.com/75510135/125416068-0d35bb28-d535-4170-8254-08cde1cbb898.png">


<img width="761" alt="image" src="https://user-images.githubusercontent.com/75510135/125416445-505ef13f-cf26-4c97-9fbf-095ac5ecbd2e.png">

<img width="745" alt="image" src="https://user-images.githubusercontent.com/75510135/125416783-a463fd6f-2b77-4438-8488-e144318fdd5b.png">

- apply ingress file again to rollout new changes[ kubectl apply -f ingress-srv.yml]
```
  519  kubectl apply -f ingress-srv.yml 
  520  kubectl get pods
  521  kubectl get deploy
  ```


# Skaffold
<img width="691" alt="image" src="https://user-images.githubusercontent.com/75510135/125419339-e62b96af-e5ef-4af6-a33a-bca76f3c4a86.png">
<img width="1014" alt="image" src="https://user-images.githubusercontent.com/75510135/125419588-1082dc46-9a9f-4aeb-98a2-6c2ee663a619.png">

<img width="665" alt="image" src="https://user-images.githubusercontent.com/75510135/125429689-fd25dbe1-6341-4448-8da7-b933c79f0a7b.png">

<img width="733" alt="image" src="https://user-images.githubusercontent.com/75510135/125429874-aae70f5f-33f5-4a1c-91df-bb899f24c2e2.png">
- skaffold.yaml

```
apiVersion: skaffold/v2alpha3
kind: Config
deploy:
  kubectl:
    manifests:
      - ./infra/k8s/*
build:
  local:
    push: false
  artifacts:
    - image:  rupeshpanwar/client
      context: client
      docker:
        dockerfile: Dockerfile
      sync:
        manual:
          - src: 'src/**/*.js'
            dest: .
    - image:  rupeshpanwar/comments
      context: comments
      docker:
        dockerfile: Dockerfile
      sync:
        manual:
          - src: '*.js'
            dest: .
    - image:  rupeshpanwar/event-bus
      context: event-bus
      docker:
        dockerfile: Dockerfile
      sync:
        manual:
          - src: '*.js'
            dest: .
    - image:  rupeshpanwar/moderation
      context: moderation
      docker:
        dockerfile: Dockerfile
      sync:
        manual:
          - src: '*.js'
            dest: .
    - image:  rupeshpanwar/posts
      context: posts
      docker:
        dockerfile: Dockerfile
      sync:
        manual:
          - src: '*.js'
            dest: .
    - image:  rupeshpanwar/query
      context: query
      docker:
        dockerfile: Dockerfile
      sync:
        manual:
          - src: '*.js'
            dest: .
            
     ```

- skaffold dev

blog $ skaffold dev
Listing files to watch...
 - rupeshpanwar/client
 - rupeshpanwar/comments
 - rupeshpanwar/event-bus
 - rupeshpanwar/moderation
 - rupeshpanwar/posts
 - rupeshpanwar/query
Generating tags...
 - rupeshpanwar/client -> rupeshpanwar/client:255b786
 - rupeshpanwar/comments -> rupeshpanwar/comments:255b786
 - rupeshpanwar/event-bus -> rupeshpanwar/event-bus:255b786
 - rupeshpanwar/moderation -> rupeshpanwar/moderation:255b786
 - rupeshpanwar/posts -> rupeshpanwar/posts:255b786
 - rupeshpanwar/query -> rupeshpanwar/query:255b786
Checking cache...
 - rupeshpanwar/client: Not found. Building
 - rupeshpanwar/comments: Not found. Building
 - rupeshpanwar/event-bus: Not found. Building
 - rupeshpanwar/moderation: Not found. Building
 - rupeshpanwar/posts: Not found. Building
 - rupeshpanwar/query: Not found. Building
Starting build...
Found [docker-desktop] context, using local docker daemon.
Building [rupeshpanwar/query]...












