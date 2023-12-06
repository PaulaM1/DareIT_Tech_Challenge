# DareIT_Tech_Challenge
Challenge from TASK 8, where I can showcase my technical skills.

### GOAL: 
Create your own application which use open-source or community software, such as WordPress.
Use one of the below depending on the complexity of the solution:
* static website in GCS
* single VM
* AppEngine
* two VMs behind a Load Balancer
* Kubernetes cluster (GKE)

### MY SOLUTION:
I have created static website (index.html) and use Terraform and Infrastructure as Code to deploy a website to Google Cloud Platform. 
I have created bellow resources in my challenge:
* An external IP address
* An entry in Cloud DNS to map the IP address to the domain name
* A GCS bucket
* A load balancer with CDN
* A managed certificate for HTTPS

### MY STEPS:
1) Configure Terraform Provider to use the GCP and GCP beta.
2) Create Service Account for terraform with json key
3) Create a GCS bucket to hostmy static files (with public permission)
4) Create the managed DNS Zone in order to add IP address to the DNS
5) Create LoadBalancer, the CDN, and map them to serve the bucket content
6) Create a CI/CD pipeline using GitHub Actions (in the workflow, job is triggered whenever a new pull request is opened)

<br>
<img src="DIAGRAM.png" alt="Architecture diagram" title="Project architecture">

## Solution to scaling the service and delivering the content to a larger audience in a real-world:

Explanation: I decided to deploy app this way because it is one of the good approach to deploy a static website and put some files behind a CDN on GCP. I also used IaC (terraform), because then I can easily replicate the infrastructure somewhere else if needed.

### Architecture description - Solution: 
If any of the users try to visit my website, then Cloud DNS (Domain Name System) will handle the request of whatever my domain is.\
Next go to the CDN (Content Distribution Network), which using Google's global edge network to bring content as close to the users as possible. In this reason CDN reduce latency, cost in loading backend server and allow easily to scale to millions of users.\
At the end will be using Cloud Load Balancer to forward this requests to Cloud Storage where it is bucket contining website content.\
Load Balancer can balance HTTP and HTTPS traffic across multiple backend instances, across multiple regions. In this reason my app is available via a single global IP address.
