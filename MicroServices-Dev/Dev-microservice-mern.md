# Microservice breakdown
  - Main Application
  <img width="848" alt="image" src="https://user-images.githubusercontent.com/75510135/124701249-dec4b600-df0b-11eb-9caf-b9210f639cbe.png">

  - Post Create and list
<img width="804" alt="image" src="https://user-images.githubusercontent.com/75510135/124681825-035a6700-dee7-11eb-95b7-fd143aeb80f0.png">


  - Comment Create and list
<img width="808" alt="image" src="https://user-images.githubusercontent.com/75510135/124684393-a6fa4600-deec-11eb-9d2b-9ab7b464fa83.png">

<img width="803" alt="image" src="https://user-images.githubusercontent.com/75510135/124684751-7961cc80-deed-11eb-8bee-b000d088f56d.png">

  - For React App
 
 <img width="861" alt="image" src="https://user-images.githubusercontent.com/75510135/124701358-103d8180-df0c-11eb-9f3c-0110b083cc93.png">
 
  - Post Create
 <img width="604" alt="image" src="https://user-images.githubusercontent.com/75510135/124755358-e3f42600-df48-11eb-90f7-d6da55df234e.png">


  - Comment Create
 <img width="828" alt="image" src="https://user-images.githubusercontent.com/75510135/124747430-8a3b2e00-df3f-11eb-8505-6e7479f800af.png">
 
 
 - Sync Solution 

<img width="897" alt="image" src="https://user-images.githubusercontent.com/75510135/124755518-16058800-df49-11eb-875b-ef999456e6c9.png">

 - Async Solution

<img width="915" alt="image" src="https://user-images.githubusercontent.com/75510135/124755627-3b929180-df49-11eb-8d11-636f82ed54b9.png">

<img width="843" alt="image" src="https://user-images.githubusercontent.com/75510135/124755686-4cdb9e00-df49-11eb-806a-7a6ffd47be5e.png">

<img width="779" alt="image" src="https://user-images.githubusercontent.com/75510135/124755762-6250c800-df49-11eb-8cf1-cdcc5ccb6a7b.png">

- QnA
<img width="879" alt="image" src="https://user-images.githubusercontent.com/75510135/124756005-a348dc80-df49-11eb-85a7-88b2cfb8b79c.png">

- EventBus
<img width="747" alt="image" src="https://user-images.githubusercontent.com/75510135/124756105-beb3e780-df49-11eb-8026-7028a854726e.png">

<img width="793" alt="image" src="https://user-images.githubusercontent.com/75510135/124756158-c8d5e600-df49-11eb-8f9f-a1fe859e6a1a.png">

<img width="864" alt="image" src="https://user-images.githubusercontent.com/75510135/124756826-882a9c80-df4a-11eb-9cec-c525cb0f37ea.png">


  - Data Query Service - to hold data from Post n Comments

<img width="869" alt="image" src="https://user-images.githubusercontent.com/75510135/124768680-7d760480-df56-11eb-8083-2e5fd5c51600.png">


- Query service , modify React App
<img width="886" alt="image" src="https://user-images.githubusercontent.com/75510135/125166093-96c9bb80-e1b7-11eb-957d-b54940dd7b22.png">

- ADD a simple feature- comment moderation - to flag for a word 
<img width="799" alt="image" src="https://user-images.githubusercontent.com/75510135/125167891-5c185100-e1c0-11eb-82ab-d2096194013e.png">

<img width="847" alt="image" src="https://user-images.githubusercontent.com/75510135/125168027-05f7dd80-e1c1-11eb-8c54-16d597b685d4.png">

- approach 1 - Moderation service
<img width="768" alt="image" src="https://user-images.githubusercontent.com/75510135/125168382-f1b4e000-e1c2-11eb-84f0-6227f28e8b7c.png">

- approach 2
<img width="778" alt="image" src="https://user-images.githubusercontent.com/75510135/125168576-cf6f9200-e1c3-11eb-895a-3062cc567d2b.png">

<img width="620" alt="image" src="https://user-images.githubusercontent.com/75510135/125168634-0fcf1000-e1c4-11eb-9e6e-626990c23668.png">

<img width="334" alt="image" src="https://user-images.githubusercontent.com/75510135/125168653-25dcd080-e1c4-11eb-8711-a4c4f9195c8b.png">

<img width="917" alt="image" src="https://user-images.githubusercontent.com/75510135/125168664-312ffc00-e1c4-11eb-9615-13f2a0638127.png">


<img width="878" alt="image" src="https://user-images.githubusercontent.com/75510135/125168777-b7e4d900-e1c4-11eb-8b65-f645babcca14.png">

<img width="825" alt="image" src="https://user-images.githubusercontent.com/75510135/125168852-0a25fa00-e1c5-11eb-96d1-aa31cebedab9.png">

1. Note add logic for above , refer github repo
    1. Create boiler plate code for Meoderation service
    2. Add Status field in Comment service
    3. Emit event from Moderation service
    4. Comment service will check the status to approve or reject
    5. lastly Query Service will parse the event and update the comment
<img width="833" alt="image" src="https://user-images.githubusercontent.com/75510135/125179661-f2269880-e20d-11eb-8bfa-b0e16fe2dde5.png">

<img width="795" alt="image" src="https://user-images.githubusercontent.com/75510135/125179726-9a3c6180-e20e-11eb-99dc-5a5e5d877545.png">

2. Dealing with Events

<img width="887" alt="image" src="https://user-images.githubusercontent.com/75510135/125183860-46923e00-e237-11eb-9d3f-f35d0dd54814.png">

<img width="916" alt="image" src="https://user-images.githubusercontent.com/75510135/125183896-8a854300-e237-11eb-8b78-c17f2fa9d99c.png">

- solution - approach1
<img width="578" alt="image" src="https://user-images.githubusercontent.com/75510135/125183914-a4268a80-e237-11eb-8344-01f1de36df99.png">

<img width="738" alt="image" src="https://user-images.githubusercontent.com/75510135/125184030-45154580-e238-11eb-8c4a-f7f67f23b9f5.png">
<img width="798" alt="image" src="https://user-images.githubusercontent.com/75510135/125184107-cd93e600-e238-11eb-8c2a-9808cd06b8a2.png">






