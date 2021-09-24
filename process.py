log_file = open("um-server-01.txt") #It is opening the file um-server-01.txt and assigning it to log_file


def sales_reports(log_file):    #Declaring a function called sales_report and passing in log_file
    for line in log_file:       #A for loop that will go through the data in the log_file
        line = line.rstrip()    #Assigning the data in line onto line without the trailing character /N
        day = line[0:3]         #Assigning the data from line that is the day
        if day == "Mon":        #Checking to see if day equals "Tue"/tuesday
            print(line)         #If it is equal then it will  print out the line


# sales_reports(log_file)         #It's calling the function sales_report


def over_ten(log_file):
    for line in log_file:
        line = line.rstrip()    
        amount = line[16:17]  
        if amount > 10:
            print(float (amount))       
        
    
over_ten(log_file)

