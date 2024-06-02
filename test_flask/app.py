import flask


from flask import Flask

app = Flask(__name__)


from flask import url_for

@app.route('/')
def index():
    print(url_for('profile', username='sadf'))
    return 'index'

@app.route('/login')
def login():
    return 'login'

@app.route('/user/<username>')
def profile(username):
    print(url_for('index'))
    return f'{username}\'s profile'
