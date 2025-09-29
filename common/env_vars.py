from dotenv import load_dotenv
import os

load_dotenv()

BASE_URL = os.environ.get('BASE_URL', 'https://demoqa.com')
TEST_USER = {
    'username': os.environ.get('TEST_USER_USERNAME', 'username'),
    'password': os.environ.get('TEST_USER_PASSWORD', 'myDefaultPassword'),
    'firstname': os.environ.get('TEST_USER_FIRSTNAME', 'firstname'),
    'lastname': os.environ.get('TEST_USER_LASTNAME', 'lastname'),
}