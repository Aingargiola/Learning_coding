#This is a text based adventure game set in the pokemon univierse challenge for gym badges and battle your way to the top.
import random
print("Welcome to you pokemon adventure your journey has just begun.")
player=input(str("What is your name\n"))

pokemon=("Charmander, Bulbasur, Squirtle")
starter=input("Which pokemon do you choose\nHere are the pokemon " + pokemon + "\n")
starter=starter.lower()
print("You chose " + starter + " as your starter pokemon")
Player_health=10
play_again='y'

while(play_again == 'y'):
    print("You have made it to your first gym trainer Brock.  He is a strong trainer that uses onix.")
    badge=0
    tackle=2
    rock_throw=random.randint(1,3)
    ember=random.randint(1,5)
    vine_whip=random.randint(3, 6)
    Bubble=random.randint(3,6)
    onix_health=10
    onix_attack=[tackle, rock_throw]
    onix_hp=str(onix_health)
    ember_level=str(ember)
    vine_level=str(vine_whip)
    Bubble_level=str(Bubble)
    while (Player_health > 0):
        if starter=="charmander":
            # attack=input("Do you want to attack with tackle or ember?")
            if (Player_health > 0 and onix_health > 0):
                attack=input("Do you want to attack with tackle or ember?")
                if attack == "ember":
                    print("You deal " + ember_level + " to the onix")
                    onix_health=(onix_health - ember)
                    onix_hp=str(onix_health)
                    print("onix new health total is "+ onix_hp)
                    print("onix attacks back")
                    enemy_attack=random.choice(onix_attack)
                    Player_health=(Player_health - enemy_attack)
                    Char_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with " + enemy_last_attack + " your new health is " + Char_hp)
                else:
                    print("Your Charmander attackes with tackle dealing 2 damage to the onix")
                    onix_health=(onix_health - tackle)
                    onix_hp=str(onix_health)
                    print("onix new health total is "+ onix_hp)
                    print("onix attacks back")
                    enemy_attack=random.choice(onix_attack)
                    Player_health=(Player_health - enemy_attack)
                    Char_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with " + enemy_last_attack + " your new health is " + Char_hp)
            elif (onix_health <= 0):
                print("You have beaten brock")
                badge= badge + 1
                
                break
            else:
                print("you have lost to brock")
                break
                
        elif starter=="bulbasur":
            # attack=input("Do you want to attack with tackle or Vinewhip?")
            if (Player_health > 0 and onix_health > 0):
                attack=input("Do you want to attack with tackle or Vinewhip?")
                if attack == "Vinewhip":
                    print("You deal " + (vine_level + 2) + " to the onix")
                    onix_health=(onix_health - (vine_whip +2))
                    onix_hp=str(onix_health)
                    print("onix new health total is "+ onix_hp)
                    print("onix attacks back")
                    enemy_attack=random.choice(onix_attack)
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with " + enemy_last_attack + " your new health is " + Bulb_hp)
                else:
                    print("Your Bulbasur attackes with tackle dealing 2 damage to the onix")
                    onix_health=(onix_health - tackle)
                    onix_hp=str(onix_health)
                    print("onix new health total is "+ onix_hp)
                    print("onix attacks back")
                    enemy_attack=random.choice(onix_attack)
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with " + enemy_last_attack + " your new health is " + Bulb_hp)

            
            elif (onix_health <= 0):
                print("You have beaten brock")
                badge= badge + 1
                break
            else:
                print("you have lost to brock")
                quit
        elif starter=="squirtle":
            # attack=input("Do you want to attack with tackle or Bubble?")
            if (Player_health > 0 and onix_health > 0):
                attack=input("Do you want to attack with tackle or Bubble?")
                if attack == "Bubble":
                    print(f"You attack with bubble and deal " + (Bubble_level) + " damage to the onix")
                    onix_health=(onix_health - (Bubble))
                    onix_hp=str(onix_health)
                    print("onix new health total is "+ onix_hp)
                    print("onix attacks back")
                    enemy_attack=random.choice(onix_attack)
                    Player_health=(Player_health - enemy_attack)
                    Sqir_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with " + enemy_last_attack + " your new health is " + Sqir_hp)
                else:
                    print("Your Squirtle attackes with tackle dealing 2 damage to the onix")
                    onix_health=(onix_health - tackle)
                    onix_hp=str(onix_health)
                    print("onix new health total is "+ onix_hp)
                    print("onix attacks back")
                    enemy_attack=random.choice(onix_attack)
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with " + enemy_last_attack + " your new health is " + Sqir_hp)
            elif (onix_health < 0):
                print("You have beaten brock")
                badge= badge + 1
                break
            else:
                print("you have lost to brock")
                break
        else:
            print("Pokemon not found")
            break
    star_health=20
    Player_health=20
    slash=3
    quicka=4
    water_gun=random.randint(2,6)
    print("You have made it to the second gym leader.\nMisty is a strong gym leader that uses Water pokemon.")
    print("Misty sends out Starmie")
    
    while(Player_health > 0):
        # print("You have made it to the second gym leader.\nMisty is a strong gym leader that uses Water pokemon.")
        # print("Misty sends out Starmie")
        
        if starter=="charmander":
            print("Your pokemon has gained 10hp and learned slash")
            # attack=input("Do you want to attack with slash or ember?")
            if (Player_health > 0 and star_health > 0):
                attack=input("Do you want to attack with slash or ember?")
                if attack == "ember":
                    print("You deal " + ember_level + " to the starmie")
                    star_health=(star_health - ember)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=(water_gun + 2)
                    Player_health=(Player_health - enemy_attack)
                    Char_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with " + enemy_last_attack + " your new health is " + Char_hp)
                else:
                    print("Your Charmander attackes with slash dealing 3 damage to the onix")
                    star_health=(star_health - tackle)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=(water_gun + 2)
                    Player_health=(Player_health - enemy_attack)
                    Char_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with water gun your new health is " + Char_hp)
            elif (star_health <= 0):
                print("You have beaten Misty")
                badge=badge + 1
                break
            else:
                print("you have lost to Misty")
                break
                
        elif starter=="bulbasur":
            print("Your pokemon has gained 10hp and learned Quick attack")
            attack=input("Do you want to attack with quickattack or Vinewhip?")
            if (Player_health > 0 and star_health > 0):
                if attack == "Vinewhip":
                    print("You deal " + vine_level + " to the onix")
                    star_health=(star_health - vine_whip)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with " + enemy_last_attack + " your new health is " + Bulb_hp)
                else:
                    print("Your Bulbasur attackes with quick attack dealing 4 damage to the Starmie")
                    star_health=(star_health - quicka)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with water gun your new health is " + Bulb_hp)

            
            elif (star_health <= 0):
                print("You have beaten Misty")
                badge= badge + 1
                break
            else:
                print("you have lost to Misty")
                break
        elif starter=="squirtle":
            print("Your pokemon has gained 10hp and learned slash")
            attack=input("Do you want to attack with slash or Bubble?")
            if (Player_health > 0 and star_health > 0):
                if attack == "Bubble":
                    print("You attack with bubble and deal " + Bubble_level + " damage to the Starmie")
                    star_health=(star_health - Bubble)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun - 2
                    Player_health=(Player_health - enemy_attack)
                    Sqir_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with Water gun its not very affective your new health is " + Sqir_hp)
                else:
                    print("Your Squirtle attackes with tackle dealing 2 damage to the onix")
                    star_health=(star_health - slash)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun - 2
                    Player_health=(Player_health - enemy_attack)
                    Sqir_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with Water gun its not very affective your new health is " + Sqir_hp)
            elif (star_health <= 0):
                print("You have beaten Misty")
                badge = badge + 1
                print(f"You have completed your pokemen journey with {badge} badges")
                play_again = input("Do you want to play again y/n")
                break
            else:
                print("you have lost to Misty")
                break
                
        else:
            print("Pokemon not found")
            break
    print("You have made it to the third gym leader Surge he uses a Raichu")
    raichu_health=15
    Player_health=30
    Bubblebeam=random.randint(3,7)
    razor_leaf=random.randint(2,8)
    Bite=5
    thunder_bolt=random.randint(2,9)
    print("Lance sends out a raichu its is Strong and fast but has low hp")
    while(Player_health > 0):
        # print("You have made it to the second gym leader.\nMisty is a strong gym leader that uses Water pokemon.")
        # print("Misty sends out Starmie")
        
        if starter=="charmander":
            print("Your pokemon has gained 10hp and learned Bite")
            # attack=input("Do you want to attack with slash or ember?")
            if (Player_health > 0 and raichu_health > 0):
                attack=input("Do you want to attack with Bite or ember?")
                if attack == "ember":
                    print("You deal " + ember_level + " to the Raichu")
                    raichu_health=(raichu_health - ember)
                    raichu_hp=str(raichu_health)
                    print("Raichu new health total is "+ raichu_hp)
                    print("Raichu attacks back")
                    enemy_attack=(thunder_bolt)
                    Player_health=(Player_health - enemy_attack)
                    Char_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Raichu attacks with " + enemy_last_attack + " your new health is " + Char_hp)
                else:
                    print("Your Charmander attackes with Bite dealing 5 damage to the onix")
                    raichu_health=(raichu_health - Bite)
                    raichu_hp=str(raichu_health)
                    print("Raichu new health total is "+ raichu_hp)
                    print("Raichu attacks back")
                    enemy_attack=(thunder_bolt)
                    Player_health=(Player_health - enemy_attack)
                    Char_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Raichu attacks with thunder bolt your new health is " + Char_hp)
            elif (raichu_health < 1):
                print("You have beaten Sugre")
                badge=badge + 1
                break
            else:
                print("you have lost to Surge")
                break
                
        elif starter=="bulbasur":
            print("Your pokemon has gained 10hp and learned Razor Leaf")
            attack=input("Do you want to attack with quickattack or Razor Leaf?")
            if (Player_health > 0 and star_health > 0):
                if attack == "Razor Leaf":
                    print("You deal " + razor_leaf + " to the Raichu")
                    raichu_health=(star_health - razor_leaf)
                    raichu_hp=str(raichu_health)
                    print("Raichu new health total is "+ raichu_hp)
                    print("Raichu attacks back")
                    enemy_attack=thunder_bolt
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Raichu attacks with " + enemy_last_attack + " your new health is " + Bulb_hp)
                
                    
                else:
                    print("Your Bulbasur attackes with quick attack dealing 4 damage to the Raichu")
                    raichu_health=(raichu_health - quicka)
                    raichu_hp=str(raichu_health)
                    print("Starmie new health total is "+ raichu_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with water gun your new health is " + Bulb_hp)

            
            elif (raichu_health < 1):
                print("You have beaten Lance")
                badge= badge + 1
                break
            else:
                print("you have lost to Lance")
                break
        elif starter=="squirtle":
            print("Your pokemon has gained 10hp and learned Bubblebeam")
            attack=input("Do you want to attack with slash or Bubblebeam?")
            if (Player_health > 0 and star_health > 0):
                if attack == "Bubblebeam":
                    print("You attack with bubblebeam and deal " + Bubblebeam + " damage to the Raichu")
                    raichu_health=(raichu_health - Bubblebeam)
                    raichu_hp=str(raichu_health)
                    print("Raichu new health total is "+ raichu_hp)
                    print("Raichu attacks back")
                    enemy_attack=thunder_bolt + 2
                    Player_health=(Player_health - enemy_attack)
                    Sqir_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Raichu attacks with Thunder bolt its very affective your new health is " + Sqir_hp)
                    # Break Point
                else:
                    print("Your Squirtle attackes with slash dealing 3 damage to the Raichu")
                    star_health=(star_health - slash)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun - 2
                    Player_health=(Player_health - enemy_attack)
                    Sqir_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("onix attacks with Water gun its not very affective your new health is " + Sqir_hp)
            elif (star_health < 1):
                print("You have beaten Surge")
                badge = badge + 1
                print(f"You have completed your pokemen journey with {badge} badges")
                play_again = input("Do you want to play again y/n")
                break
            else:
                print("you have lost to Surge")
                break
    break



    
            

        
