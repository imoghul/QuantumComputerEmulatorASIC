numNonDFF = 0
numDFF = 0
areaNonDFF = 0
areaDFF = 0
with open("reports/cell_report_final.rpt") as f:
    read_data = ""
    for i in range(18): read_data = f.readline()
    isDFF = False;
    while(not("--------------------------------------------------------------------------------" in read_data)):
        isDFF = "DFF" in read_data
        # print(read_data,isDFF)
        if(isDFF):
            numDFF+=1;
        else:
            numNonDFF += 1;
        num = f.readline().replace(" ","").replace("n","").replace("r","")
        num = float(num)
        if(isDFF):
            areaDFF+=num;
        else:
            areaNonDFF+=num

        read_data = f.readline()

print(numDFF, areaDFF, numNonDFF, areaNonDFF)