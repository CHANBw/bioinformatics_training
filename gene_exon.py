#   chenbaowei
#   2022/5/23 11:01

# 将gene、exon起始位置输出
out_file1 = open("D:/bioinformatics/Python/gene_exon_total1.txt","w")
with open("D:/bioinformatics/Python/training/Rs_Gene.gff") as file_object:
    for line in file_object:
        line = line.rstrip("\n")   # 删除行尾的换行符
        array = line.split("\t")
        subarray = array[8].split(";")
        name = subarray[-1].replace('name=','')
        if array[2] == 'gene':
            out_file1.write("\n")
            out_file1.write(name+"\t"+array[3]+"\t"+array[4]+"\t")
        if array[2] == 'exon':
            out_file1.write(array[3]+"\t"+array[4]+"\t")

out_file1.close()
file_object.close()

# 统计外显子大小
out_file1 = open("D:/bioinformatics/Python/exon_size.txt","w")
with open("D:/bioinformatics/Python/gene_exon_total1.txt") as f:
    for line in f:
        lin = line.strip().split()
        a = len(lin)
        for i in range(4,a,2):
            exon_size = (int(lin[i])-int(lin[i-1]))+1
            out_file1.write("\n"+lin[0]+"\t"+str(exon_size)+"\t")

out_file1.close()
f.close()

# 统计外显子数量
out_file1 = open("D:/bioinformatics/Python/exon_num.txt","w")
with open("D:/bioinformatics/Python/gene_exon_total1.txt") as f:
    for line in f:
        lin = line.strip().split("\t")
        a = len(lin)
        exon_num = (a-3)/2
        out_file1.write(lin[0]+"\t"+str(exon_num)+"\n")

out_file1.close()
f.close()


