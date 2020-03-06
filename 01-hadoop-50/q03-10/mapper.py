import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for i in sys.stdin:
		word=i.split(',')[0]
		val=i.split(',')[1] 
		val=int(val)
		sys.stdout.write("{}\t{}\t{}\n".format(val,word,val))
