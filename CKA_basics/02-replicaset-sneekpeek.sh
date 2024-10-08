
* Reference:                                                                                      *
* ----------                                                                                      *
* https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/                *
* https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#how-a-replicaset-works    *
***************************************************************************************************

# frontend.yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3


***************************************************************************************************


# 2. Deploy ReplicaSet
-----------------------
kubectl apply -f <FILENAME.YAML>
or 
kubectl create -f <FILENAME.YAML>

***************************************************************************************************

# 3. Display ReplicaSet (rs)
----------------------------
kubectl get rs 
kubectl get rs <RS-NAME> -o wide
kubectl get rs <RS-NAME> -o yaml
kubectl get rs -l <LABEL>     


***************************************************************************************************

# 4. Displaying Pods 
---------------------
kubectl get pods
kubectl get pods -l <LABEL>  

***************************************************************************************************


# 5. Print Details of ReplicaSet
--------------------------------
kubectl describe rs <RS-NAME>


***************************************************************************************************


# 6. Scaling Applications
-------------------------
kubectl scale rs <RS-NAME> --replicas=[COUNT]     


***************************************************************************************************


# 7. Editing ReplicaSet
-----------------------
kubectl edit rs <RS-NAME>      


***************************************************************************************************


# 8. Running operations directly on the YAML file
--------------------------------------------------
SYNTAX: kubectl [OPERATION] –f [FILE-NAME.yaml]

kubectl get –f [FILE-NAME.yaml]
kubectl describe –f [FILE-NAME.yaml]
kubectl edit –f [FILE-NAME.yaml]
kubectl delete –f [FILE-NAME.yaml]
kubectl create –f [FILE-NAME.yaml]


***************************************************************************************************


# 9. Deleting ReplicaSet
-------------------------
kubectl delete rs <RS-NAME>


***************************************************************************************************
You will deploy the sample ReplicaSet, then Validate, Scale, Edit and Cleanup.

PRE-REQ: 
--------
a. To successfully finish this exercise, It is important to go through ReplicaSet Concept and Demo videos in this series.
b. You can refer to Kuberenetes Docs for help when needed.


***************************************************************************************************

STEP-1: Create ReplicaSet:
--------------------------
Write the ReplicaSet YAML file with below configuration and Deploy it using kubectl apply command.

Container Image: redis
ReplicaSet Name: redis-rs
Replicas: 3


***************************************************************************************************


STEP-2: Validate ReplicaSet (rs) and Pods:
------------------------------------------

a. Display "redis-rs" replicaset and ensure "Desired, Current, Read" count is 3 
b. Display the complete details of "redis-rs" by running "..describe replicaset.." command
c. Print the labels of "redis-rs" ReplicaSet.

c. Display the Pods which are created by this ReplicaSet
d. Ensure, "redis-rs" replicaset creates exact 3 three replicas
c. Identify on which worker nodes these Pods are scheduled 



***************************************************************************************************


STEP-3: Edit the ReplicaSet
---------------------------

a. Edit the "redis-rs" ReplicaSet and update the replica count from 3 to 5.
b. Display the "redis-rs" replicaSet and ensure "Desired, Current, Ready" is 5.
c. Display the Pods and Ensure two extra Pods are created. Total 5 Pods related to "redis-rs" should be "Running"


***************************************************************************************************


STEP-4: Delete the ReplicaSet:
------------------------------

a. Delete the ReplicaSet. 
b. Display the ReplicaSet and Ensure "redis-rs" replicaSet is deleted.
c. Display Pods and Ensure "redis-rs" related Pods are deleted.


***************************************************************************************************


