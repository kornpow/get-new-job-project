# Sam Korn

- **Email**: korn94sam@gmail.com
- **Phone**: (720) 333-4371
- **LinkedIn**: [linkedin.com/in/samuel-korn](https://www.linkedin.com/in/samuel-korn/)
- **GitHub**: [github.com/kornpow](https://github.com/kornpow)
- **Address**: 12922 Delaware Ct. Westminster, CO 80234
---

## Education

### Electrical and Computer Engineering W/ Computer Science Minor

**University of Colorado** - Boulder, CO  
*August 2012 - May 2016*

---

## Work Experience

### Backend and Platform | **Voltage Cloud**
*Sept 2021 - Oct 2023*

- Created a Lightning Service Provider tool called `Flow`, using the Lightning Labs `Pool` software.
- Primary developer of "node launcher" website backend, written in Python, using AWS Lambda/SAM/Cloudformation for deployment.
- Created a site-to-site VPN between our AWS and GCP datacenters. Designed and managed our employee Wireguard VPN network.
- Worked as a team to enable our customer kubernetes workloads to be deployed on both AWS EKS and Google GKE clusters.
- Continually worked to improve our monitoring/alerting capabilities using self-hosted grafana and prometheus stacks.
- Contributed to improving our CI/CD workflows. Created GitHub Actions to run tests, and update cloud configuration parameters. Helped to maintain our ArgoCD deployment infrastructure.

### Dev Ops | **Biarri Networks**
*Aug 2020 - Sept 2021*

- Maintained and upgraded our Jenkins CI/CD server
- Led an effort to migrate our jobs from classic Jenkins to using Jenkinsfiles, which is easier to store as code.
- Implemented a system upgrade for our high-performance solver servers, minimizing customer downtime, while adhering to strict upgrade requirements.

### IoT, Electronics, and Cloud Software | **Babylon Micro-Farms**
*Aug 2017 - July 2020*

- Wrote embedded linux Python code for our farm modules, and managed OTA updates to the devices.
- Developed a Django based backend API which ingested farm sensor data, and allowed for control of the device using a mobile app.
- Though I usually prefer open collaboration if possible, my team was awarded a patent for an automated hydroponics nutrient dosing system: [https://patents.justia.com/patent/20200396917](https://patents.justia.com/patent/20200396917)
---

## Skills

- **Languages**: Python, Go, NodeJS
- **Tools**: Git, Kubernetes, Terraform, Jenkins, Cloudformation, GitOps, Docker
- **Databases**: DynamoDB, PostgreSQL
- **Clouds**: Primarily AWS, some GCP experience

---

## Projects

### **Resume demo project**
An application which leverages skills learned in various previous roles. Hosted on domain: [https://samkorn.me](https://samkorn.me)

- Create a two node `k3s` (minified kubernetes) cluster with one node in the cloud and one node "on-prem" at my home.
- Terraform to create the cloud infrastructure and security groups.
- Packer to create AMIs which contains the cluster software.
- A FastAPI web application which converts markdown to HTML and displays to the screen.
- Additional workloads in development:
    - LNBits payment gateway: [https://lnbits.lightningspore.com](https://lnbits.lightningspore.com)
    - IoT Label Printer: [https://samkorn.xyz/labelprinter](https://samkorn.xyz/labelprinter)

GitHub Link -> [https://github.com/kornpow/get-new-job-project](https://github.com/kornpow/get-new-job-project)


### **IoT Prometheus Temperature and Humidity Sensor** - 
A MicroPython + hardware project, which communicates to a temperature and humidity sensor.

- Hardware is a Raspberry Pi Pico W wired to a AM2301 sensor.
- Runs a webserver on the embedded device, and returns data in prometheus data format.
- Grafana agent on another device queries the sensor server and sends data to Grafana Cloud where data can be graphed and analyzed.

GitHub Link -> [https://github.com/kornpow/dht20-prometheus](https://github.com/kornpow/dht20-prometheus)

## Interests

- Open-source contribution: Testing various Bitcoin/Lightning Network tools and creating issues, talking to developers, etc.
- Health/Fitness: Running, lifting, keto diet, and outdoor activities
- Self-sufficiency: Gourmet mushroom growing, gardening, brewing, soap making

