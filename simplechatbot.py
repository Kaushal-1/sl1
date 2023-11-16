import subprocess
import time
import webbrowser

def wish_me():
    current_time = time.localtime()
    hour = current_time.tm_hour

    if hour < 12:
        print("Good Morning!")
    elif 12 <= hour < 17:
        print("Good Afternoon!")
    else:
        print("Good Evening!")

def execute_command(command):
    if command in ["hi", "hey", "hello"]:
        print("Hello!")
    elif command in ["bye", "stop", "exit"]:
        print("Goodbye!")
        exit(0)
    elif command == "open notepad":
        print("Opening Text Editor")
        subprocess.run(["gedit"])  # Use "gedit" as the default text editor on Ubuntu
    elif command == "open chrome":
        print("Opening Google Chrome")
        subprocess.run(["google-chrome"])
    elif command == "open firefox":
        print("Opening Firefox")
        subprocess.run(["firefox"])
    elif command == "open youtube":
        print("Opening YouTube")
        webbrowser.open("https://www.youtube.com")
    elif command == "open instagram":
        print("Opening Instagram")
        webbrowser.open("https://www.instagram.com")
    # Add more commands as needed
    else:
        print("Sorry, could not understand your query. Please try again.")

if _name_ == "_main_":
    print("\t\t\t<============================= W E L C O M E =============================>")
    print("\t\t\t<============================= I'M A VIRTUAL ASSISTANT =============================>")

    password = input("=======================\n| ENTER YOUR PASSWORD |\n=======================\n\n")

    if password == "chauhan":
        print("\n<===============================================================>\n")
        wish_me()

        while True:
            print("\n<===============================================================>\n")
            print("How can I help you?\n")

            user_command = input("Your query ===> ")
            print("\nHere is the result for your query ===> ", end="")
            execute_command(user_command)

    else:
        print("Incorrect Password. Please enter the correct password.")
