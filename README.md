# robotframework-experimental-bookstore
Experimental project for discovering ```RobotFramework``` capabilities in automated **API** and **E2E** testing.  
Author: Péter Kovács

---

**System Under Test:** 
- [DemoQA's Book store application](https://demoqa.com/books)
- [Book Store API v1](https://demoqa.com/swagger/#/)

---

**Learning Resources:**
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Browser Library](https://marketsquare.github.io/robotframework-browser/Browser.html)

---

**TODO:**  
- [x] Creating initial project structure  
- [x] Introducing environment variable handling  
- [ ] Writing E2E tests
  - [x] ~~Registration~~ (_skipped yet because of captcha_)
  - [x] Login
  - [x] Logout
  - [ ] Store
  - [ ] Profile
- [ ] Writing API tests
  - [ ] Defining models
  - [ ] BOOKSTORE/BOOKS - CRUD
  - [ ] BOOKSTORE/BOOK - GET/DELETE
  - [ ] ACCOUNT/AUTHORIZATION - POST
  - [ ] ACCOUNT/USER - GET/POST/DELETE
- [ ] Dockerizing project
  - [ ] Move everything into an src/ directory
  - [ ] Regenerating requirements.txt
  - [ ] Creating Dockerfile
