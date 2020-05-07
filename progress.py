import sys 


class progressBar:
  def __init__(self, minValue = 0, maxValue = 100, totalWidth=75):
    self.progBar = ""   # This holds the progress bar string
    self.oldprogBar = ""
    self.min = minValue
    self.max = maxValue
    self.span = maxValue - minValue
    self.width = totalWidth
    self.amount = 0       # When amount == max, we are 100% done 
    self.updateAmount(0)  # Build progress bar string
  
  def appendAmount(self, append):
    self.updateAmount(self.amount + append)
      
  def updatePercentage(self, newPercentage):
      # Updates the progress bar to the new percentage. 
    self.updateAmount((newPercentage * float(self.max))/100.0)
  
  def updateAmount(self, newAmount = 0):
  
    if newAmount < self.min: newAmount = self.min
    if newAmount > self.max: newAmount = self.max
    self.amount = newAmount
  
    # Figure out the new percent done, round to an integer
    diffFromMin = float(self.amount - self.min)
    percentDone = (diffFromMin / float(self.span)) * 100.0
    percentDone = int(round(percentDone))
    
    # Figure out how many hash bars the percentage should be
    allFull = self.width - 2
    numHashes = (percentDone / 100.0) * allFull
    numHashes = int(round(numHashes))
    
  # Build a progress bar with an arrow of equal signs; special cases for
  # empty and full
    if numHashes == 0:
      self.progBar = "[>%s]" % (' '*(allFull-1))
    elif numHashes == allFull:
      self.progBar = "[%s]" % ('='*allFull)
    else:
      self.progBar = "[%s>%s]" % ('='*(numHashes-1), ' '*(allFull-numHashes))
  
    # figure out where to put the percentage, roughly centered
    percentPlace = (len(self.progBar) / 2) - len(str(percentDone))
    percentString = str(percentDone) + "%"
    
    # slice the percentage into the bar
    self.progBar = ' '.join([self.progBar, percentString])
  
  def draw(self):
    if self.progBar != self.oldprogBar:
      self.oldprogBar = self.progBar
      sys.stdout.write(self.progBar + '\r')
      sys.stdout.flush()      # force updating of screen

  def __str__(self):
    return str(self.progBar)      



value=0
flag=0
max=0

if  len(sys.argv)  > 1 : 
  max=int(sys.argv[1])
  flag=1

else:  
  print("usage: progress.py MAXSIZE")
  sys.exit(0)


def update(value):
     
  f=open('progress.txt','r') 
  value=int(f.readline())
      
  prog = progressBar(maxValue = max)
  prog.updateAmount(value)
  prog.draw()


def main():
  if flag == 1 : 
    update(value)
  
if __name__ == '__main__':
  main()
  
 