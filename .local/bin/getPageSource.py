#!/usr/bin/env python3

import os
import sys
from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FirefoxOptions


site=sys.argv[1]
sourceFile=sys.argv[2]

options = webdriver.FirefoxOptions()
options.headless = True

driver = webdriver.Firefox(options = options)
driver.get(site)


driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
driver.findElement(By.id("cookie_action_close_header")).click();


pageSource = driver.page_source

fileToWrite = open(sourceFile, "w")
fileToWrite.write(pageSource)
fileToWrite.close()

driver.quit()
os.remove('geckodriver.log')
