with open("reports/cell_report_final.rpt") as f:
    reached = False;
    file = f.readlines();
    sum = 0
    logicSum = 0
    isInfo = False;
    data = []

    isDFF = False

    for line in file:

        tmp = line.split(" ")
        l = [i for i in tmp if i != '']
        
        if('--------------------------------------------------------------------------------\n' in l):
            reached = not reached;
            continue;
        if(not reached): continue;
        if("Total" in l): break;

        isInfo = not isInfo
        
        if(isInfo): 
            isDFF = "DFF" in l[1]
        
        else:
            sum+=float(l[0])
            if(not isDFF): logicSum += float(l[0])

    print(round(sum,6), round(logicSum,6))        