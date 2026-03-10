# Failure Scenarios Test Guide

This document describes how to simulate failures in the infrastructure to verify system resilience.

Architecture under test:

Internet
↓
Application Load Balancer
↓
EC2 Auto Scaling Group
↓
RDS Multi-AZ Database

The goal is to ensure the system can tolerate failures without service interruption.

---

# Test 1 — EC2 Instance Failure

Purpose:
Verify that the Auto Scaling Group automatically replaces failed instances.

Steps:

1. Open AWS Console
2. Navigate to EC2 → Instances
3. Identify an instance belonging to the Auto Scaling Group
4. Terminate the instance

Expected Behavior:

- The Auto Scaling Group detects the instance termination
- A new instance is automatically launched
- The Application Load Balancer routes traffic only to healthy instances
- No user-visible downtime should occur

Validation:

Check:

EC2 → Auto Scaling Group → Activity History

You should see a new instance launch event.

---

# Test 2 — High Traffic Load

Purpose:
Verify that the Auto Scaling Group scales out under load.

Steps:

Run the load test script from the project root:

./scripts/load-test.sh http://ALB-DNS

Expected Behavior:

- CPU utilization increases
- CloudWatch metrics show rising load
- Auto Scaling launches additional EC2 instances
- Traffic continues to be distributed by the load balancer

Validation:

Check:

CloudWatch → Metrics → EC2 → CPUUtilization

Verify new instances appear in the Auto Scaling Group.

---

# Test 3 — RDS Failover

Purpose:
Verify database high availability using Multi-AZ.

Steps:

1. Open AWS Console
2. Navigate to RDS → Databases
3. Select the primary database instance
4. Click "Reboot with failover"

Expected Behavior:

- RDS promotes the standby instance to primary
- Application reconnects automatically using the same endpoint
- Downtime should be minimal (usually under 60 seconds)

Validation:

Check:

RDS → Events

You should see a failover event recorded.

---

# Test 4 — Target Instance Drain

Purpose:
Verify that the load balancer stops routing traffic to unhealthy instances.

Steps:

1. Go to EC2 → Target Groups
2. Select the application's target group
3. Deregister one instance

Expected Behavior:

- ALB stops sending traffic to that instance
- Remaining instances handle requests
- Service remains available

Validation:

ALB target group health status should update accordingly.

---

# Summary

The system should remain operational under:

- Instance failure
- High traffic
- Database failover
- Target instance removal

If the architecture is working correctly, users should experience little to no downtime.