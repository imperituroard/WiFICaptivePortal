require 'pru'
dfd="+375298766719"
p dfd.gsub!('+','')

p dfd.length

gfd= dfd[0]+dfd[1]+dfd[2]
p gfd
p dfd[0]+dfd[1]+dfd[2]
dfd[5]="3"
p dfd