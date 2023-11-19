with open("../result/cell_report_final.rpt") as f:
    reached = False;
    file = f.readlines();
    sum = 0
    logicSum = 0
    isInfo = False;
    data = []

    isDFF = False

    lastIsInfo = False
    for i,line in enumerate(file):

        tmp = line.split(" ")
        l = [i for i in tmp if i != '']
        
        if('--------------------------------------------------------------------------------\n' in l):
            reached = not reached;
            continue;
        if(not reached): continue;
        if("Total" in l): break;

        isInfo = any("_X" in i for i in l)#not isInfo
        
        if(isInfo): 
            isDFF = "DFF" in l[1]
        
        elif lastIsInfo:
            sum+=float(l[0])
            if(not isDFF): logicSum += float(l[0])
        lastIsInfo = isInfo

    print("TOTAL: ",round(sum,6),"\nLOGIC: ", round(logicSum,6))        