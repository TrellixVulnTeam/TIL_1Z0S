import logging
import os
from flask import Flask
from flask import jsonify
from sqlalchemy import create_engine
from flask_restful import Api
from api.utils.database import db
from api.utils.responses import response_with
import api.utils.responses as resp
from api.routes.product import product_routes
from api.config.config import DevelopmentConfig, ProductionConfig, TestingConfig
from flask_jwt_extended import JWTManager
from flask_swagger import swagger
from flask_swagger_ui import get_swaggerui_blueprint
from apispec import APISpec
import unittest


def create_app(test_config=None):  # 1)
    app =Flask(__name__)
    if os.environ.get('WORK_ENV') == 'PROD':
        app_config = ProductionConfig
    elif os.environ.get('WORK_ENV') == 'TEST':
        app_config = TestingConfig
    else:
        app_config = DevelopmentConfig
    app.config.from_object(app_config)
    db.init_app(app)
    with app.app_context():
        db.create_all()

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


    app.register_blueprint(product_routes, url_prefix='/api/products')
    swaggerui_blueprint = get_swaggerui_blueprint('/api/docs', '/api/spec', config={'app_name': "Flask Author DB"})
    app.register_blueprint(swaggerui_blueprint, url_prefix=swaggerui_blueprint.url_prefix)
    jwt = JWTManager(app)

    return app

app = create_app()



if __name__ == "__main__":
    app.run(port=5000, host="127.0.0.1", use_reloader=False )