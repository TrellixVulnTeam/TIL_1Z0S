import logging
import os
from flask import Flask
from flask import jsonify
from test02.api.utils.database import db
from test02.api.utils.responses import response_with
import test02.api.utils.responses as resp
from test02.api.routes.authors import author_routes
from test02.api.routes.books import book_routes
from test02.api.routes.users import user_routes
from test02.api.config.config import DevelopmentConfig, ProductionConfig, TestingConfig
from flask_jwt_extended import JWTManager
from flask_swagger import swagger
from flask_swagger_ui import get_swaggerui_blueprint
from apispec import APISpec
import unittest

app = Flask(__name__)

if os.environ.get('WORK_ENV') == 'PROD':
    print("check1")
    app_config = ProductionConfig
elif os.environ.get('WORK_ENV') == 'TEST':
    print("check2")
    app_config = TestingConfig
else:
    print("check3")
    app_config = DevelopmentConfig

app.config.from_object(app_config)

db.init_app(app)
with app.app_context():
    db.create_all()
app.register_blueprint(author_routes, url_prefix='/api/authors')
app.register_blueprint(book_routes, url_prefix='/api/books')
app.register_blueprint(user_routes, url_prefix='/api/users')


# START GLOBAL HTTP CONFIGURATIONS
@app.after_request
def add_header(response):
    return response


@app.errorhandler(400)
def bad_request(e):
    logging.error(e)
    return response_with(resp.BAD_REQUEST_400)


@app.errorhandler(500)
def server_error(e):
    logging.error(e)
    return response_with(resp.SERVER_ERROR_500)


@app.errorhandler(404)
def not_found(e):
    logging.error(e)
    return response_with(resp.SERVER_ERROR_404)


# END GLOBAL HTTP CONFIGURATIONS


@app.route("/api/spec")
def spec():
    swag = swagger(app, prefix='/api')
    swag['info']['base'] = "http://localhost:5000"
    swag['info']['version'] = "1.0"
    swag['info']['title'] = "Flask Author DB"
    return jsonify(swag)


swaggerui_blueprint = get_swaggerui_blueprint('/api/docs', '/api/spec', config={'app_name': "Flask Author DB"})
app.register_blueprint(swaggerui_blueprint, url_prefix=swaggerui_blueprint.url_prefix)
jwt = JWTManager(app)
db.init_app(app)
# mail.init_app(app)
with app.app_context():
    # from api.models import *
    db.create_all()

if __name__ == "__main__":
    unittest.main()
    # app.run(port=5000, host="127.0.0.1", use_reloader=False, )