#!/usr/bin/env python

import requests
import urllib2

categories = urllib2.urlopen("http://169.254.169.254/latest/meta-data").read()

print categories

sub_url = raw_input("Enter the category of meta-data of your choice from above list:")

url = "http://169.254.169.254/latest/meta-data"

new_url = url + "/" + sub_url


contents = urllib2.urlopen(new_url).read()


print contents
