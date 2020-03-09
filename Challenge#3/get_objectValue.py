#!/usr/bin/python

def get_value(obj,path):
  keys = path.split('/')
  for key1 in obj:
    obj = obj[key1]
    for key2 in obj:
      obj = obj[key2]
      for key3 in obj:
        obj = obj[key3]
        print obj
        return obj
        
if __name__ == '__main__':
  obj = {"a":{"b":{"c":"d"}}}
  key = "a/b/c"
  get_value(obj,key)
