
class Config(object):
    DEBUG = True
    TESTING = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:12345678@127.0.0.1:3306/convinence"
    SQLALCHEMY_ECHO = False
    JWT_SECRET_KEY = 'JWT-SECRET'
    SECRET_KEY = 'SECRET-KEY'
    SECURITY_PASSWORD_SALT = 'SECRET-KEY-PASSWORD'


class DevelopmentConfig(Config):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:12345678@127.0.0.1:3306/convinence"
    SQLALCHEMY_ECHO = False
    JWT_SECRET_KEY = 'JWT-SECRET'
    SECRET_KEY = 'SECRET-KEY'
    SECURITY_PASSWORD_SALT = 'SECRET-KEY-PASSWORD'


class TestingConfig(Config):
    TESTING = True
    SQLALCHEMY_ECHO = False
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:12345678@127.0.0.1:3306/convinence"
    SQLALCHEMY_ECHO = False
    JWT_SECRET_KEY = 'JWT-SECRET'
    SECRET_KEY = 'SECRET-KEY'
    SECURITY_PASSWORD_SALT = 'SECRET-KEY-PASSWORD'