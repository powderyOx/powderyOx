#from selenium import webdriver
#import time

#url='https://www.alternate.at/Grafikkarten?filter_2195=19&filter_2203=NVIDIA+GeForce+RTX+3080&filter_2203=NVIDIA+GeForce+RTX+3070&filter_2203=NVIDIA+GeForce+RTX+3070+Ti&filter_2203=NVIDIA+GeForce+RTX+3080+Ti&s=price_asc'

#d = webdriver.Chrome()
#d.get(url)


import requests
from bs4 import BeautifulSoup
import difflib
import time
from datetime import datetime

# target URL
url = "https://www.caseking.de/pc-komponenten/grafikkarten/nvidia/geforce-rtx-3070?sPage=1&sSort=3"
# act like a browser
headers = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}

PrevVersion = ""
FirstRun = True
while True:

    # download the page
    response = requests.get(url, headers=headers)
    # parse the downloaded homepage
    soup = BeautifulSoup(response.text, "lxml")

    # remove all scripts and styles
    for script in soup(["script", "style"]):
        script.extract()
    soup = soup.get_text()
    # compare the page text to the previous version
    if PrevVersion != soup:
        # on the first run - just memorize the page
        if FirstRun == True:
            PrevVersion = soup
            FirstRun = False
            print("Start Monitoring " + url + "" + str(datetime.now()))
        else:
            print("Changes detected at: " + str(datetime.now()))
            OldPage = PrevVersion.splitlines()
            NewPage = soup.splitlines()
            # compare versions and highlight changes using difflib
            d = difflib.Differ()
            diff = d.compare(OldPage, NewPage)
            out_text = "\n".join([ll.rstrip() for ll in '\n'.join(diff).splitlines() if ll.strip()])
            print(out_text)
            OldPage = NewPage
            # print ('\n'.join(diff))
            PrevVersion = soup
    else:
        print("No Changes " + str(datetime.now()))
    time.sleep(300)
    continue


