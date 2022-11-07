from flask import Flask, make_response, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc
import os

api = Flask(__name__)

# Conexão com o banco
api.config['SQLALCHEMY_DATABASE_URI'] = f'mysql://{os.getenv("MYSQL_USER")}:{os.getenv("MYSQL_PASSWORD")}@mysql/{os.getenv("MYSQL_DATABASE")}'
api.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# Configuração para aceitar utf8 no json
api.config['JSON_AS_ASCII'] = False

db = SQLAlchemy(api)

# Model para criação da tabela
class Sentenses(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sentense = db.Column(db.String(80), nullable=False)

# Inserir a string no banco e retornar com 201 + string
@api.route('/paste', methods=['GET','POST'])
def paste_string():
    data = Sentenses(sentense=os.getenv("STRING_API"))
    try:
        db.session.add(data)
        db.session.commit()
        return make_response(
            jsonify(data.sentense), 201
        )
    except exc.SQLAlchemyError:
        return make_response(
            jsonify("Verifique a conexao com o banco de dados"), 500
        )

if __name__ == '__main__':
    with api.app_context():
        db.create_all()
    api.run(host='0.0.0.0')