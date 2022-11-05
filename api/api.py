from flask import Flask, make_response, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import exc

api = Flask(__name__)
api.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:abcd1234@172.28.0.2/challange'
api.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(api)

class Sentenses(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sentense = db.Column(db.String(20), nullable=False)


@api.route('/paste', methods=['GET','POST'])
def paste_string():
    data = Sentenses(sentense="Ola Inoa")
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