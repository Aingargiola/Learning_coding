import requests

def fetch_sp500_growth():
    # Replace 'YOUR_API_KEY' with your actual API key from Alpha Vantage or another provider
    API_KEY = " 0OLVKMUCBKLJDE4P"
    SYMBOL = "SPY"  # SPY is an ETF that tracks the S&P 500
    URL = f"https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol={SYMBOL}&apikey={API_KEY}"

    try:
        response = requests.get(URL)
        response.raise_for_status()
        data = response.json()

        # Extract monthly closing prices
        monthly_data = data["Monthly Time Series"]
        closing_prices = [
            float(value["4. close"]) for key, value in monthly_data.items()
        ]

        # Calculate the 10-year average growth rate
        if len(closing_prices) >= 120:  # Ensure we have at least 10 years of data
            start_price = closing_prices[119]  # Price 10 years ago
            end_price = closing_prices[0]  # Most recent price
            growth_rate = ((end_price / start_price) ** (1 / 10)) - 1
            return growth_rate
        else:
            print("Not enough data to calculate 10-year growth rate.")
            return 0.08  # Default to 8% if data is insufficient
    except Exception as e:
        print(f"Error fetching S&P 500 data: {e}")
        return 0.08  # Default to 8% in case of an error

# Fetch the growth rate dynamically
growth = fetch_sp500_growth()

age = int(input("How old are you\n"))
r_age = int(input("What age would you like to retire\n"))
work_years = int(r_age - age)

held = int(input("What percentage of your check do you withhold?\n"))
match = int(input("How much is your company match?\n"))
salary = int(input("What is your yearly salary?\n"))

money = int(salary * (held / 100))
match_money = int(salary * (match / 100))
total_money = int(money + match_money)
increase = int(input("How much do you expect your pay to go up per year?\n"))
print("Money you put in " + str(money))
print("Total amount added this year with match " + str(total_money))
roth_balance = int(input("Do you have any starting balance in your account?\n"))
print("Your growth rate is: " + str(growth))
while True:
    roth_balance = (total_money + roth_balance) + (roth_balance * growth)
    age += 1
    print(f"Your roth balance at {age} was: {round(roth_balance, 2)}")
    roth_growth = roth_balance * growth
    print(f"Your roth growth this year was {round(roth_growth, 2)}")
    salary += increase
    print(f"Your salary this year was {salary}")
    money = int(salary * (held / 100))
    match_money = int(salary * (match / 100))
    total_money = int(money + match_money)
    if age == r_age:
        retire = input("Do you want to calculate your post-retirement income? Y/N \n").upper()
        death = 90
        while retire == "Y":
            growth = float(0.04)
            roth_balance += roth_balance * growth
            r_years = int(death - r_age)
            r_salary = float(roth_balance * growth)
            roth_balance -= r_salary
            age += 1
            print("Your yearly salary to live off is:")
            print(round(r_salary, 2))
            print("Your remaining balance is:")
            print(round(roth_balance, 2))
            print(f"Your current age is {age}")
            if age == death:
                break
        if age == death:
            break
print("Your remaining balance at death to pass onto your kids is:")
print(round(roth_balance, 2))