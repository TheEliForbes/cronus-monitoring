#login.py
#To run this,  $ python login.py $IP

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
