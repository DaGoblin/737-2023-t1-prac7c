# SIT737-Task7.2C

## Github Repo

https://github.com/DaGoblin/737-2023-t1-prac7c.git


Calculator Deployment with replica sets see https://github.com/DaGoblin/737-2023-t1-prac7c/blob/main/createDeployment.yaml

![kubernetes Dashboard Deployment Starting state](/doco/images/DashboardCalculatorDeploymentStart.png)

## Setting up temporary port forwarding 
As we don’t care which one of the replicaset pods we are connected to we use you the deployment as the target for port forwarding. Our calculator microservice is running on port 4000 inside the container we will forward it to our local port 3005 to access it in browser.
Command: `kubectl port-forward deployment/calculator-deployment 3005:4000`

![Image of CLI port forwarding](/doco/images/PortForwardCLI.png)

![Image of browser port 3006 forwarding to container port 4000](/doco/images/PortForwardBrowser.png)

## Updating our program and image
There are a number of ways this can be achieved and some debate on correct methods, here we have created an automated build process to update and version our docker image but we will manually update the image in our deployment which will propagate to each replica. It would also be possible to update our deployment.ymal with imagePullPolicy: Always to force retrieval of the latest image. A valid modern method here would be to add this to our update script and/or use github actions to update the image push. 
Inspiration from this article (Reeder, 2016)

Release script: https://github.com/DaGoblin/737-2023-t1-prac7c/blob/main/CalculatorMS/release.sh

Build script: https://github.com/DaGoblin/737-2023-t1-prac7c/blob/main/CalculatorMS/build.sh

Update from version 1.0.0 to version 1.2.0

### Docker hub updated tag version.

![Docker Hub image showing new version](/doco/images/DockerhubUpdate.png)

### Update deployment with new image

Command: `kubectl set image deployment/calculator-deployment calculator-ms=s222574652/kube_calculator_ms:1.2.0`

![CLI showing deployment updated to new image version](/doco/images/DeploymentUpdateCLI.png)

### View updated deployment and new replica sets

![CLI showing deployment has updated](/doco/images/DeploymentUpdateCLI2.png)





















