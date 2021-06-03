from robot.api.deco import keyword
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
ROBOT_AUTO_KEYWORDS = False
class web_driver_manager(object):
    @keyword
    def get_driver_path(self, browser):
        driver_path = ""
        if "chrome" in browser:
            driver_path = ChromeDriverManager().install()
        elif "firefox" in browser:
            driver_path = GeckoDriverManager().install()
        print(driver_path)
        return driver_path