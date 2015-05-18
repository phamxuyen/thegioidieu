D:\xampp\mysql\bin\mysqldump -d --comments=FALSE -u root oc_vision > 1_schema.sql 
D:\xampp\mysql\bin\mysqldump -t --order-by-primary --comments=FALSE -u root oc_vision > 2_init_data.sql