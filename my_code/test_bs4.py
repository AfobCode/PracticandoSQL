from urllib import request
from bs4 import BeautifulSoup
from ssl import CERT_NONE, create_default_context
import xml.etree.ElementTree as ET

# Create the context to aviod SSL certificates

cxt = create_default_context()
cxt.check_hostname = False
cxt.verify_mode = CERT_NONE
# url = input('Enter the name of the url')

url_1 = "http://py4e-data.dr-chuck.net/comments_42.xml"
url_2 = "http://py4e-data.dr-chuck.net/comments_2159525.xml"

web_page = request.urlopen(url_2,context= cxt).read()

soup = BeautifulSoup(web_page,'html.parser')

comments_list = soup.find_all('comment')

comments_count = [int(comment.find('count').text) for comment in comments_list]
print(sum(comments_count))


