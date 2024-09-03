**Project Overview for DevOps Class:**

**Scenario:**
Congratulations! You’ve just been hired as a DevOps engineer at a fintech startup. The company’s main product is a website that leverages AI to predict the value of stocks and send daily stock recommendations to customers.

**Product Functionality:**

1. **Stock Prediction:**
   - Users can connect to the website and submit the name of a stock. The AI will calculate and display the predicted value on the user interface.

2. **Daily Recommendations:**
   - Every evening, customers will receive an email listing 10 stocks, along with their current prices and predicted values for the next day. The email will highlight the most valuable stock to buy.

**Technical Overview:**

1. **Application:**
   - The application will be written in Python and the website will use Flask.
   - All execution results will be stored in a MySQL database.
   - The application and database will run in Docker containers.

2. **Monitoring and Metrics:**
   - The application will expose Prometheus metrics, including:
     - Number of requests made to the app.
     - Current stock values.
     - Predicted stock values.
   - Prometheus, Grafana, and Loki will be installed to monitor the system.
   - Prometheus will collect metrics from the app and system data from the VMs (using node-exporter).
   - Loki will aggregate application logs, and all data will be visualized in Grafana.

3. **Email Notifications:**
   - Emails will be sent using AWS SNS or SES.

**Architecture:**

1. **Python Application:**
   - The Flask application will have three endpoints:
     - User Interface (UI)
     - Stock value and prediction
     - Best stock recommendation (from a list of 10 stocks)
   - The application will be containerized and stored in ECR or DockerHub.
   - Deployment will be managed using Docker Compose.
   - The application will be publicly accessible.
   - Monitoring tools will be accessible only from specific IPs (e.g., via VPN).

2. **High Availability (HA):**
   - The application will run on two EC2 instances behind an Elastic Load Balancer (ELB).
   - Each EC2 instance will be located in a different Availability Zone (AZ) to ensure high availability.

3. **Caching and Storage:**
   - Images in the UI will be cached using CloudFront.
   - Images will be stored in a private S3 bucket, accessible only from EC2 instances via a private network.

4. **Automation and Scaling:**
   - A cron job will trigger the daily email notifications.
   - A Lambda function will send an email notification to the admin whenever a new image is uploaded.
   - EC2 instances will be part of an Auto Scaling Group (ASG) to handle high CPU usage.

5. **Database:**
   - The MySQL database will be hosted on Amazon RDS.

6. **Networking:**
   - The setup will include a VPC, Security Groups (SG), private and public subnets, NAT Gateway, and Internet Gateway (IGW).
   - Internal communication will use a private hosted zone in Route 53 with DNS.

7. **Infrastructure as Code (IaC):**
   - The infrastructure can be deployed using Terraform or CloudFormation.

8. **Version Control:**
   - All code will be stored in GitHub.
