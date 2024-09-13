# React App
<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126580994-81a0252d-1221-49e1-bd3f-36aec259632d.png">

-page design
<img width="1066" alt="image" src="https://user-images.githubusercontent.com/75510135/126582946-f3b353e6-d37c-41a1-8f25-407160bb1c78.png">

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126582971-18ec79e2-00c4-483f-8fcd-8b571d8b8e90.png">

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126583009-70435f52-1508-4281-9f67-79769e72be47.png">

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126583080-d12479b9-989f-416a-8de3-0a44981e2056.png">

- server side rendering approach

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126583144-5dff958d-8414-423c-b46d-c3bbdcf1c27f.png">

Suggestion Regarding a Default Export Warning

In the upcoming lecture, we will create our first components and run the Next server. You may see a warning in the terminal or browser console:

Anonymous arrow functions cause Fast Refresh to not preserve local component state.

Please add a name to your function, for example:

Before

export default () => <div />;

After

const Named = () => <div />;

export default Named;

This is a linter warning as of React v17 letting us know that it might be wise to use named exports instead.

You can suppress the warning by refactoring from this:

    export default () => {
      return <h1>Landing Page</h1>;
    };

to this:

    const Landing = () => {
      return <h1>Landing Page</h1>;
    };
     
    export default Landing;

The warning will come up a few more times in this project (and throughout the course) when creating components and can be handled similarly.

- install Dependency

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126583574-a7880dff-7384-45a2-9a24-c2002a3f202a.png">

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126584221-97f1d2b9-f6f1-458e-b442-de57610e2f93.png">
<img width="926" alt="image" src="https://user-images.githubusercontent.com/75510135/126584958-4ed15fd6-e53c-4e78-8b53-29db794a2bf5.png">

<img width="926" alt="image" src="https://user-images.githubusercontent.com/75510135/126584970-1e15395d-9eef-4fb1-980f-408a553920be.png">

<img width="1110" alt="image" src="https://user-images.githubusercontent.com/75510135/126585032-82b17aa2-6c30-4def-88df-2ceb3666d5c4.png">

- Client docker file

<img width="926" alt="image" src="https://user-images.githubusercontent.com/75510135/126586099-9d5430d9-8463-4a65-a40f-0cd2aea43e60.png">

<img width="910" alt="image" src="https://user-images.githubusercontent.com/75510135/126594253-fd4a48e3-cbd0-4d78-82d0-906664bc9b80.png">

<img width="910" alt="image" src="https://user-images.githubusercontent.com/75510135/126594268-5f8b17d1-560e-459a-ab36-8ffb3eebbad1.png">

- Add bootstrap

<img width="1031" alt="image" src="https://user-images.githubusercontent.com/75510135/126598388-86cf88ab-f586-4564-b0ef-4098af957a2b.png">

<img width="910" alt="image" src="https://user-images.githubusercontent.com/75510135/126598429-631066b2-4129-42e3-92bd-d129a7d22c87.png">

- Sign up page

<img width="750" alt="image" src="https://user-images.githubusercontent.com/75510135/126599824-d39d14eb-725c-40fd-8177-10f60e21d0f2.png">

- Sign up - Auth service

<img width="1127" alt="image" src="https://user-images.githubusercontent.com/75510135/126602029-8802cd87-16ab-4ab2-b306-4c6dcfdbdb4b.png">
<img width="750" alt="image" src="https://user-images.githubusercontent.com/75510135/126602294-55e9b618-08ac-418f-8de3-68ef9cd36e32.png">


- install axios, call API from React app

<img width="1127" alt="image" src="https://user-images.githubusercontent.com/75510135/126602176-e9580436-96a5-49d6-a66d-04d87e686c78.png">


<img width="1127" alt="image" src="https://user-images.githubusercontent.com/75510135/126602620-2f87155c-55d2-45de-9465-c582aba3a061.png">

<img width="750" alt="image" src="https://user-images.githubusercontent.com/75510135/126604362-b7cecd12-2e9a-4a81-8283-85589369719d.png">

- custom hook for Axios call and common sign up error

<img width="1073" alt="image" src="https://user-images.githubusercontent.com/75510135/126605503-ccfc6082-b84e-477a-be80-a7efaf372551.png">

- Sign up- code refactoring

<img width="1105" alt="image" src="https://user-images.githubusercontent.com/75510135/126617766-8c179b6b-d5e3-4b24-85c6-1a79ffa6afd8.png">
<img width="1105" alt="image" src="https://user-images.githubusercontent.com/75510135/126617805-e95bbd92-8538-4551-ad4b-e6ef1585db6e.png">

<img width="1105" alt="image" src="https://user-images.githubusercontent.com/75510135/126617872-028c3cb9-b995-4aa9-b154-41b30b18a531.png">
# SSR - Server side rendering
- Landing page after Sign up

<img width="1080" alt="image" src="https://user-images.githubusercontent.com/75510135/126618134-82896d30-97ac-4e5b-b165-3233a4618b9e.png">

- it should be served by current-user api

<img width="1080" alt="image" src="https://user-images.githubusercontent.com/75510135/126618445-c3d71edf-3737-46f3-83bf-189122603048.png">

- as soon as someone connects Server should serve basic html content

<img width="1080" alt="image" src="https://user-images.githubusercontent.com/75510135/126618615-b7ec64b8-8c09-4708-8676-c94d4fee6e43.png">

<img width="808" alt="image" src="https://user-images.githubusercontent.com/75510135/126619944-3de48d55-1301-44b0-b505-4166a4c90ba5.png">

A note about ECONNREFUSED errors

In the upcoming lecture at about the 4:10 timestamp, we will be moving the axios request from the getInitialProps function directly to the LandingPage as part of an explanation. This will likely fail with a long ECONNREFUSED error in your Skaffold output.

Node Alpine Docker images are now likely using the v16 version of Node, so, we will again encounter a situation that will require a catch block.

Change this code in client/pages/index.js

    const LandingPage = ({ currentUser }) => {
      console.log(currentUser);
      axios.get('/api/users/currentuser');
     
      return <h1>Landing Page</h1>;
    };

to this:

    const LandingPage = ({ currentUser }) => {
      console.log(currentUser);
      axios.get('/api/users/currentuser').catch((err) => {
        console.log(err.message);
      });
     
      return <h1>Landing Page</h1>;
    };
    
<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126622545-8dd5fbdf-ff80-43ca-8910-5705ecb2600d.png">

- possible solution

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126623835-d2bbbaf4-5f12-4095-aced-f2b1209cba62.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126624178-81a1531b-2490-43ad-bb08-78ba36e65ae7.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126624554-0fa0fe75-2395-4988-9ace-a12c156f2a22.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126625005-3e9128f5-ef33-4d40-9f66-acdb2cdfef00.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126625219-3bb1c9f2-32bd-497c-a9bb-7c75c280a07e.png">
- to access the ingress service

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126630655-2b3de7b6-b53b-4714-8011-15874b76c733.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126630758-f3c014cf-7b78-4862-a0d1-c7bec7343e01.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126630832-345fffe5-ae66-4821-9707-699b379d86cc.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126630902-3d6633dc-84b4-4408-94e9-33cbf6469579.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126631104-f313d900-3a5c-4bf1-897c-b90f51956d68.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126631268-82c86cb4-1e2c-4b31-a0f3-cf6ed8286671.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126631434-4a5339de-dbc7-48c9-8dd0-5c2d8d0136bb.png">

- on server or client

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126632193-706e8475-7c90-4a60-a603-7c1ad93dc3d1.png">

Ingress-Nginx Namespace and Service - Important Update

updated 6-10-2021

In the upcoming lecture, we will be adding the ingress-nginx service name and namespace to our axios request. This is more or less a reminder to run kubectl get services -n ingress-nginx as shown in the previous lecture "Cross Namespace Service Communication" to find the correct service name for your specific Kubernetes provider.

At the time of writing, the service name for all platforms (Windows, Mac, Linux) and Docker clients (Docker Desktop and Minikube) should be:

ingress-nginx-controller

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126632835-59ac25c4-45f2-4458-975c-9340a5138381.png">

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126633435-85ac5fc4-ff7c-4ef1-844d-baffa40db205.png">

- get service name under a namespace to configiure 

<img width="842" alt="image" src="https://user-images.githubusercontent.com/75510135/126633692-4b66938b-05ee-40c0-91e4-1a6fd09dfe89.png">
<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126634390-16902342-c081-4a45-b770-f79992ceb020.png">

- servicename : ingress-nginx-controller 
- NS : ingress-nginx

<img width="808" alt="image" src="https://user-images.githubusercontent.com/75510135/126635324-8a128c15-222c-4f6d-9839-55992c142ee5.png">

- Passing through the cookie

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126635396-646187f4-6e5b-4f64-92de-4b0099e5103e.png">

- Reusable API client

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126637867-752f5c40-75ef-4cea-9dad-d08a9ef931a8.png">

- Conent on Landing Page

<img width="992" alt="image" src="https://user-images.githubusercontent.com/75510135/126644146-1090a5a8-0732-4c42-a67b-10cc91564a7d.png">

# Sign In page
<img width="997" alt="image" src="https://user-images.githubusercontent.com/75510135/126660986-e08c487b-80c9-40f0-acf5-e84da9be2d15.png">

<img width="808" alt="image" src="https://user-images.githubusercontent.com/75510135/126661511-98966a7f-4b2c-40f6-a550-bed4ddc9db56.png">

<img width="808" alt="image" src="https://user-images.githubusercontent.com/75510135/126661550-9868ccbc-6f89-46bf-9213-54c76d1dba38.png">

# App diagram wrt Sign in/up/out flow
<img width="997" alt="image" src="https://user-images.githubusercontent.com/75510135/126663248-268c7842-c20b-48b7-8d1c-c7bbcc588626.png">

<img width="997" alt="image" src="https://user-images.githubusercontent.com/75510135/126663370-e8ff12d2-b9f8-4995-92bb-ca1b1e43dbd5.png">

<img width="997" alt="image" src="https://user-images.githubusercontent.com/75510135/126664431-cc479f29-15ba-4ffe-88a6-c91c60d3912a.png">

<img width="997" alt="image" src="https://user-images.githubusercontent.com/75510135/126666134-57696b03-9f3a-480a-b080-e6084eaf3356.png">




