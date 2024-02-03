#This is a text based adventure game set in the pokemon univierse challenge for gym badges and battle your way to the top.
import random
print("Welcome to you pokemon adventure your journey has just begun.")
player=input(str("What is your name\n"))

pokemon=("Charmander, Bulbasur, Squirtle")
starter=input("Which pokemon do you choose\nHere are the pokemon " + pokemon + "\n")
print("You chose " + starter + " as your starter pokemon")
Player_health=10
play_again='y'

while(play_again == 'y'):
    print("You have made it to your first gym trainer Brock.  He is a strong trainer that uses onix.")
    badge=0
    tackle=2
    rock_throw=random.randint(1,3)
    ember=random.randint(1,5)
    vine_whip=random.randint(3, 7)
    Bubble=random.randint(3,8)
    onix_health=10
    onix_attack=[tackle, rock_throw]
    onix_hp=str(onix_health)
    ember_level=str(ember)
    vine_level=str(vine_whip)
    Bubble_level=str(Bubble)
    while (Player_health > 0):
        if starter=="Charmander":
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
                
        elif starter=="Bulbasur":
            # attack=input("Do you want to attack with tackle or Vinewhip?")
            if (Player_health > 0 and onix_health > 0):
                attack=input("Do you want to attack with tackle or Vinewhip?")
                if attack == "Vinewhip":
                    print("You deal " + vine_level + " to the onix")
                    onix_health=(onix_health - vine_whip)
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
        elif starter=="Squirtle":
            # attack=input("Do you want to attack with tackle or Bubble?")
            if (Player_health > 0 and onix_health > 0):
                attack=input("Do you want to attack with tackle or Bubble?")
                if attack == "Bubble":
                    print("You attack with bubble and deal " + Bubble_level + " damage to the onix")
                    onix_health=(onix_health - Bubble)
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
        
        if starter=="Charmander":
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
                
        elif starter=="Bulbasur":
            print("Your pokemon has gained 10hp and learned Quick attack")
            attack=input("Do you want to attack with quickattack or Vinewhip?")
            if (Player_health > 0 and star_health > 0):
                if attack == "Vinewhip":
                    print("You deal " + vine_level + " to the onix")
                    onix_health=(star_health - vine_whip)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun
                    Player_health=(Player_health - enemy_attack)
                    Bulb_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starmie attacks with " + enemy_last_attack + " your new health is " + Bulb_hp)
                else:
                    print("Your Bulbasur attackes with quick attack dealing 4 damage to the onix")
                    star_health=(star_health - quicka)
                    star_hp=str(star_health)
                    print("onix new health total is "+ star_hp)
                    print("onix attacks back")
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
        elif starter=="Squirtle":
            print("Your pokemon has gained 10hp and learned slash")
            attack=input("Do you want to attack with slash or Bubble?")
            if (Player_health > 0 and star_health > 0):
                if attack == "Bubble":
                    print("You attack with bubble and deal " + Bubble_level + " damage to the onix")
                    star_health=(star_health - Bubble)
                    star_hp=str(star_health)
                    print("Starmie new health total is "+ star_hp)
                    print("Starmie attacks back")
                    enemy_attack=water_gun - 2
                    Player_health=(Player_health - enemy_attack)
                    Sqir_hp=str(Player_health)
                    enemy_last_attack=str(enemy_attack)
                    print("Starme attacks with Water gun its not very affective your new health is " + Sqir_hp)
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
                    print("onix attacks with Water gun its not very affective your new health is " + Sqir_hp)
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
    break



    
            

        
