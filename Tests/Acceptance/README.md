# Local test execution

1. Start Selenium:

   `java -Djava.awt.headless=true -jar ~/Selenium/selenium-server-4.33.0.jar standalone`

2. Execute Acceptance Testsuite

   * `.Build/vendor/bin/codecept run acceptance --env local -c .Build/Acceptance/AcceptanceTestsChrome.yml`
   * `.Build/vendor/bin/codecept run acceptance --env local -c .Build/Acceptance/AcceptanceTestsPhpBrowser.yml`
