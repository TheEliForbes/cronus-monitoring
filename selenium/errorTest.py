#errorTest.py
#To run this,  $ python errorTest.py $IP

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
import time
import sys

browser = webdriver.Firefox()
browser.get("http://%s/login" % sys.argv[1])  #**

time.sleep(10)

username = browser.find_element_by_name("username")
password = browser.find_element_by_name("password")

# Type user:pass and submit
username.send_keys("admin")
password.send_keys("strongpassword")

login_attempt = browser.find_element_by_xpath("//*[@type=\"submit\"]")
login_attempt.click()

# Click to Restarts Dashboard
browser.get("http://%s/dashboards" % sys.argv[1])
dashboard = browser.find_element_by_xpath("//*[@class=\"search-item search-item--indent\"][2]")
dashboard.click()

browser.get("http://%s/d/wd92dgsa/restarts-dashboard?orgId=1" % sys.argv[1])
time.sleep(2)
infobox = browser.find_element_by_xpath("//*[@class=\"panel-info-corner-inner\"][1]") 
assert infobox.value_of_css_property("color") == "rgb(142, 142, 142)"
#print("Good color means no error. Color displayed below..")
#print(infobox.value_of_css_property("color"))
