#   chenbaowei
#   2022/5/24 13:17

out_file = open("D:/bioinformatics/Python/LRR1.fasta","w")

# 先将序列储存到字典中
with open("D:/bioinformatics/Python/LRR.fasta") as file_object:
    seq = {}
    for line in file_object:
        line = line.strip()
        if line.startswith('>'):
            gene_id = line
            gene_id = gene_id.strip().split('_')[0].split('|')[-1]
            seq[gene_id] = ""
        else:
            seq[gene_id] += line.replace('\n','')

# 接下来遍历字典，将序列打印到文件中
for gene_id,sequence in seq.items():
    out_file.write('>'+gene_id+'\n')
    out_file.write(seq[gene_id]+'\n')

file_object.close()
out_file.close()






