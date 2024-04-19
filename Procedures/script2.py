from faker import Faker
import random

fake = Faker()
for i in range(60000):
    evaluator1_username = fake.user_name()
    evaluator2_username = fake.user_name()
    employee_username = fake.user_name()
    job_id = random.randint(1, 100)
    grade = random.randint(1, 20)

    sql = f" ('{evaluator1_username}', '{evaluator2_username}', '{employee_username}', {job_id}, 'completed', {grade}),"
    
    print(sql)
