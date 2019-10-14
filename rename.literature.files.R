# ensures that all authors in literature file collection
# start with a capital letter.

path.LITERATURE = '.'
source('myConfig.R')

file.list = dir(path.LITERATURE, pattern='\\.pdf$')

m = strsplit(file.list,'_')
m.len = sapply(m, length)

capSingleWord <- function(s) {
    paste(toupper(substring(s, 1,1)), substring(s, 2),sep="", collapse=" ")
}

print("Mislabeled Files:")
print("=================")
file.list[which(m.len != 3)]

sapply(m, function(x) { capSingleWord(x[1])   })

ls = sapply(file.list, capSingleWord)

for(i in 1:length(file.list)) {
    f = file.list[i]
    f.new = capSingleWord(f)
    if(f != f.new) {
        # rename file
        print(paste("from:",f," to",f.new))
        file.rename(file.path(path.LITERATURE,f), file.path(path.LITERATURE,f.new))
    }
}
