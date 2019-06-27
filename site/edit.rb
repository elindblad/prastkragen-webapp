require 'io/console'

def news()
    puts "--Redigera nyheter--"
end

def employees(data)
    puts "--Redigera Personal--\n\nVisa personal info(1) \nRedigera personal(2) \nLägg till personal(3) \nHuvudmeny(0)"
    input = STDIN.getch
    if input == "\u0003"
        exit
    elsif input == "1"
        personal =[]
        data.each do |element|
            checkline = element.strip.split(",")
            personal << checkline
        end
        puts "\n#{personal}"
    elsif input == "2"

    elsif input == "3"
    end
end

def mainmenu()
    data = File.readlines("data/user_data2.csv")
    puts "--Huvudmeny--\nVad vill du göra? Tryck på tangeten som representerar ditt val.\n\nRedigera nyehter (1)\n\nRedgiera personal (2)\n\nAvsluta (0)"
    input = STDIN.getch
    if input == "1" #Nyheter
        system "clear" or system "cls"
        news()
    elsif input == "2" #Personal
        system "clear" or system "cls"
        employees(data)
    elsif input == "0"
        puts "Avlsutar program..."
        exit
    elsif input == "\u0003"
        exit
    else
        system "clear" or system "cls"
        puts "Felatig knapptryckning"
        mainmenu()
    end
end
mainmenu()
