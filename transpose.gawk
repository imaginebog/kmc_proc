BEGIN {FS=" "}
{ 
    for (i=1;i<=NF;i++)  
    {
        a[NR,i] = $i;
        if(big <= NF)
           big=NF;
    }
}
END {    
    for(i=1;i<=big;i++) 
    {
        row=a[1,i];
        for(j=2;j<=NR;j++)
        {
            row=row" "a[j,i];
        }
        print row >> outputFile
    }
}
