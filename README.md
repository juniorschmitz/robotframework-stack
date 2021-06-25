# Robot Stack

Project containing implementations of:
- Web tests using Robot Framework + Selenium Webdriver;
- API tests using Robot Framework + Requests;
- App tests using Robot Framework + Appium;

For installing dependencies when needed:
```
pip install -U pip
pip install -r requirements.txt
```

For running the project scenarios:
```
cd <folder> (that could be api, mobile or web)
robot -d .\reports tests
```
