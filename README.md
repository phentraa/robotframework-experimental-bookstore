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
- [Requests Library](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

---

## Dockerized Robot Framework Project User Guide


### Prerequisites

Before starting, ensure the following are installed on your system:

- [Docker](https://www.docker.com/get-started) (version >= 20.10)
- Bash shell (Linux, macOS, or WSL on Windows)

> ⚠️ The project requires Docker to build and run the test environment. Make sure Docker is running before executing any commands.


### Project Files


- **Dockerfile** – Builds the Docker image with Playwright, Python, and Robot Framework dependencies.
- **robot.sh** – Script to build the Docker image and run tests.
- **src/** – Contains the test source code and `.env` file.
- **results/** – Directory where test results will be stored after execution.

### Usage

#### 1. Make `robot.sh` executable

```bash
chmod +x robot.sh
```

#### 2. Run tests

The script supports two test types: **web** and **api**.

```bash
./robot.sh [web|api]
# Examples
./robot.sh web
./robot.sh api
```
---

### What the Script Does

1. **Checks the argument**: Ensures you provide `web` or `api` as the test type.
2. **Checks for Docker**: Exits if Docker is not installed or running.
3. **Checks for ENV file**: Exits if the src/ directory has no .env file 
3. **Builds the Docker image**: Image tag is `rf-bookstore`.

   * If the image already exists, it will reuse it.
4. **Runs Robot Framework tests** inside the container:

   * Web tests: `/app/web/tests`
   * API tests: `/app/api/tests`
5. **Copies results** from the container to the local `results/` folder.
6. **Cleans up** the container after execution.

---

### Test Results

* After execution, test results are stored in: ```./results/```

* The results include standard Robot Framework files:

  * `output.xml`
  * `log.html`
  * `report.html`

Open `report.html` in a browser to view a detailed test report.

### Notes

* Ensure the `.env` file is properly configured before running the tests. It is loaded automatically into the Docker container.
* For any issues with Docker or permissions, make sure your user has access to run Docker commands without `sudo`.
* You can rebuild the image manually if needed: ```bash docker build -t rf-bookstore . ```

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
  - [x] ACCOUNT/AUTHORIZATION - POST
  - [ ] ACCOUNT/USER - GET/POST/DELETE
- [x] Dockerizing project
  - [x] Move everything into an src/ directory
  - [x] Creating Dockerfile
  - [x] Creating executor shell script
