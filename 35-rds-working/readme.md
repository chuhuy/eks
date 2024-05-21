# install psql on bastion host

for Amazon Linux 2023

```
# Install
sudo yum search "postgres"

sudo yum install postgresql15.x86_64 -y

# Verify
psql --version

# Connect
psql -h <host-name> -p 5432 -d <db-name> -U <user-name>

psql -h students.culc3cntmkhf.ap-southeast-1.rds.amazonaws.com -p 5432 -U dbadmin -d vietaws

```

# create sample data

```
# check table
\dt

# create table
CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL, score INT);

# insert new records
INSERT INTO students(id, name, score)
VALUES
  (DEFAULT, 'Viet Tran', 5),
  (DEFAULT, 'Raymond', 7),
  (DEFAULT, 'Alex', 6),
  (DEFAULT, 'Tommy', 7),
  (DEFAULT, 'David', 8),
  (DEFAULT, 'Kumishida', 6),
  (DEFAULT, 'Jenni', 8),
  (DEFAULT, 'Kevin', 7),
  (DEFAULT, 'Mina',9);
```
