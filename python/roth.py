age = int(input("How old are you\n"))
r_age = int(input("What age would you like to retire\n"))
work_years = int(r_age - age)

held = int(input("What percentage of your check do you with hold?\n"))
match =int(input("How much is you company match?\n"))
salary = int(input("What is your yearly salary\n"))

money = int(salary * (held / 100))
match_money = int(salary * (match/100))
total_money = int(money + match_money)
increase = int(input("How much do you expect your pay to go up a year?\n"))
growth = float(.07)
print(money)
print(total_money)
roth_balance = int(input("Do you have anything starting in your account?\n"))
Death = int(input("How old do you think you will live?"))

while True:
    roth_balance = (total_money  + roth_balance) + (roth_balance * growth)
    age = age + 1
    print(f"Your roth balance at {age} was:")
    print(round(roth_balance, 2))
    print(f"Your roth growth this year was {roth_balance * growth}")
    salary = salary + increase
    print(f"Your salary this year was {salary}")
    money = int(salary * (held / 100))
    match_money = int(salary * (match/100))
    total_money = int(money + match_money)
    if age == r_age:
        break
retire = input("Do you want to calculate your post retirement income? YN \n")
while retire == "Y":
    growth = float(.04)
    roth_balance = roth_balance + (roth_balance * growth)
    r_years = int(Death - r_age)
    r_salary =float(roth_balance  * growth)
    roth_balance = float(roth_balance - r_salary)
    age = age + 1
    print(" Your yearly salary to live off is:")
    print(round(r_salary, 2))
    print("Your remainng balance is ")
    print(round(roth_balance, 2))
    print(f"Your current age is {age}")
    if age == Death:
        break
print("Your remaining balance at death to pass onto your kids is:")
print(round(roth_balance, 2))