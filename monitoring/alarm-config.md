# Monitoring Alarm Configuration

## ALB 5xx Errors

Threshold:
5 errors in 2 minutes

Possible causes:
- Application crash
- Backend instance failure
- Database connection issue

Response:
1. Check ALB target health
2. Check EC2 logs
3. Verify RDS connectivity

---

## EC2 CPU Utilization

Threshold:
80% CPU for 2 minutes

Possible causes:
- Traffic spike
- inefficient code
- insufficient scaling

Response:
1. Check Auto Scaling group
2. Verify instance count
3. Review application logs

---

## RDS Free Storage

Threshold:
2GB remaining

Response:
1. Increase RDS storage
2. Archive old data
3. Review database usage