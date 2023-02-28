import os
import pathlib
import csv
import random


dir=os.getcwd()

def insert_data(file,table,datafile):
    with open(datafile) as csvfile:
        reader=csv.DictReader(csvfile, delimiter=' ', quotechar='|')
        
        for row in reader:
            print(row)
            
            
def name_generater():
    firstname=random.choice(["John","Jack","Sebastian","Pierre","Lewis","Vasper","Micheal","Damian","Chris","Dom","Lance"])
    
    lastname=random.choice(["Zhao","Zhou","Vettel","Massi","Ratum","Hamilton","Verstappen","Paul","Harden","Jordan","Stroll","Loeb","Swift"])
    return firstname+' '+lastname


def url_generater():
    base="https://www.youtube.com/"
    exten=random.sample('zyxwvutsrqponmlkjihgfedcba1234567890',10)
    new_ext=""
    for cha in exten:
        new_ext+=str(cha)
        
    return base+new_ext
    
def address_generater():
    home=random.randint(1,5000)
    direction=random.choice('WSEN')
    street=random.randint(1,99)
    city=random.choice(['Los Angeles','New York',"San Francisco","San Diego","New Mexico","Atlanta"])
    
    
    return str(home)+' '+direction+' '+str(street)+' '+city
    
def generate_data(file,rows,table,sample_data):
    with open(file,"w+") as sqlfile:
        
        for i in range(rows):
            new_data=[]
            for column in sample_data:
                
                if type(column)==str:
                    new_string=""
                    if column[0]>='0' and column[0]<='9' and column!='address'and column!='name' and column !='url':
                        lis=random.sample('1234567890',len(column))
                        for cha in lis:
                            new_string+=cha
                    elif column!='address'and column!='name' and column !='url':
                        lis=random.sample('zyxwvutsrqponmlkjihgfedcba',len(column))
                        for cha in lis:
                            new_string+=cha
                    elif column=='address':
                        new_string=address_generater()
                    elif column=='name':
                        new_string=name_generater()
                        
                    else:
                        new_string=url_generater()
                        
                    

                                      
                    
                    new_data.append("'"+new_string+"'")
                    
                if type(column)==int:
                    new_data.append(random.randint(0,10*column))
                    
                if type(column)==float:
                    new_data.append(int(random.uniform(0,200*column))/100)
                    
                    
            sqlfile.write("insert into "+table+" values("+str([value[1:-1] if type(value)==str else value for value in new_data])[1:-1]+");\n")
            #print("insert into "+table+" values("+str([str(value) for value in new_data])[1:-1] +");")
                    
    
       
table_name="sponsor"
#sample=['adfadfpasdu','name','178102729',"address","url",20,7.9]
sample=['adfadfpasdu','url',7000.57]
generate_data(os.path.join(dir,"test.sql"),20,"sponsor_detail",sample)

# data=os.path.join(dir,table_name+".csv")
# insert_data(os.path.join(dir,"Q1.sql"),table_name,data)