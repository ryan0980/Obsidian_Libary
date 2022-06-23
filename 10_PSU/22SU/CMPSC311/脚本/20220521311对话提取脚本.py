#读取txt里特定格式的文本，删除部分

# open file in read mode


#20220521Cmpsc311Lec2.txt

#read txt method two
f = open("20220521Cmpsc311Lec2.txt")
for line in open("20220521Cmpsc311Lec2.txt"):
    line=line.replace("Suman Saha:","\n")
    print (line)





