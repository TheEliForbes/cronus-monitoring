#errorTest.py
#To run this,  $ python errorTest.py $IP

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
import time
import sys

#Initialize Firefox WebDriver
browser = webdriver.Firefox()
#Load desired page
browser.get("http://%s/login" % sys.argv[1])

#Wait for page to load
time.sleep(10)

#Input Credentials
username = browser.find_element_by_name("username")
password = browser.find_element_by_name("password")
username.send_keys("admin")
password.send_keys("strongpassword")

#Submit Form
login_attempt = browser.find_element_by_xpath("//*[@type=\"submit\"]")
login_attempt.click()

#Navigate to Dashboards List page
browser.get("http://%s/dashboards" % sys.argv[1])
time.sleep(2)

#Navigate to a Specific Dashboard
dashboard = browser.find_element_by_xpath("//*[@class=\"search-item search-item--indent\"][2]")
dashboard.click()
browser.get("http://%s/d/wd92dgsa/restarts-dashboard?orgId=1" % sys.argv[1]) #Load page after click
time.sleep(2)
infobox = browser.find_element_by_xpath("//span[@class=\"panel-info-corner-inner\"][1]") 
#Assert that a panel has imported properly
assert infobox.value_of_css_property("color") == "rgb(142, 142, 142)"
#Good color means no error, Color can be displayed below
#print(infobox.value_of_css_property("color"))
